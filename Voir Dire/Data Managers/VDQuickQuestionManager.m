//
//  VDQuickQuestionManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionManager.h"
#import "VDJurorManager.h"
#import "VDJurorToQuickQuestion.h"

static NSMutableDictionary *trialCaseIDToQuickQuestions = nil;

@implementation VDQuickQuestionManager

-(id)init {
    return nil;
}

+(void)quickQuestionsForTrialCase:(VDTrialCase*)trialCase withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trialCaseIDToQuickQuestions = [[NSMutableDictionary alloc] initWithCapacity:5];
    });
    
    __block NSMutableArray *quickQuestions = [trialCaseIDToQuickQuestions objectForKey:[NSNumber numberWithInt:trialCase.trialCaseID]];
    if (quickQuestions == nil) {
        [VDJurorManager jurorsForTrialCase:trialCase withSuccessHandler:^(NSMutableArray *jurors){
            quickQuestions = [[NSMutableArray alloc] initWithCapacity:5];
            for (NSInteger i = 0; i < 5; i++) {
                VDQuickQuestion *quickQuestion = [[VDQuickQuestion alloc] init];
                
                quickQuestion.quickQuestionID = i;
                quickQuestion.lawFirmUserID = 0;
                quickQuestion.trialCaseID = trialCase.trialCaseID;
                quickQuestion.dateTimeStamp = [[NSDate alloc] initWithTimeIntervalSinceNow:-10000];
                quickQuestion.question = [NSString stringWithFormat:@"This is Quick Question #%i for Trial Case: %i", quickQuestion.quickQuestionID, quickQuestion.trialCaseID];
                
                NSMutableArray *jurorToQuickQuestions = [[NSMutableArray alloc] initWithCapacity:jurors.count];
                [jurors enumerateObjectsUsingBlock:^(VDJuror *juror, NSUInteger idx, BOOL *stop) {
                    VDJurorToQuickQuestion *jurorToQuickQuestion = [[VDJurorToQuickQuestion alloc] init];
                    jurorToQuickQuestion.jurorID = juror.jurorID;
                    jurorToQuickQuestion.quickQuestionID = quickQuestion.quickQuestionID;
                    
                    NSInteger answerInt = arc4random() % 5;
                    switch (answerInt) {
                        case 0:
                            jurorToQuickQuestion.answer = @"Yes";
                            break;
                        case 1:
                            jurorToQuickQuestion.answer = @"No";
                            break;
                        case 2:
                            jurorToQuickQuestion.answer = @"Maybe";
                            break;
                        case 3:
                            jurorToQuickQuestion.answer = @"Declined to Answer";
                            break;
                        case 4:
                            jurorToQuickQuestion.answer = @"N/A";
                            break;
                    }
                    
                    [jurorToQuickQuestions addObject:jurorToQuickQuestion];
                }];
                quickQuestion.jurorToQuickQuestions = jurorToQuickQuestions;
                
                [quickQuestions addObject:quickQuestion];
            }
            
        } withFailure:^(NSError *error){
            failure(error);
        }];
    }
    success(quickQuestions);
}

@end
