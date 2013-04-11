//
//  VDJurorQuestionManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorQuestionManager.h"

static NSMutableDictionary *jurorIDToJurorQuestions = nil;

@implementation VDJurorQuestionManager

-(id)init {
    return nil;
}

+(void)questionsForJuror:(VDJuror*)juror withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jurorIDToJurorQuestions = [[NSMutableDictionary alloc] initWithCapacity:5];
    });
    
    NSMutableArray *questions = [jurorIDToJurorQuestions objectForKey:[NSNumber numberWithInt:juror.jurorID]];
    if (questions == nil) {
        questions = [[NSMutableArray alloc] initWithCapacity:5];
        
        for (NSInteger i = 0; i < 5; i++) {
            VDJurorQuestion *question = [[VDJurorQuestion alloc] init];
            
            question.questionID = i;
            question.jurorID = juror.jurorID;
            question.lawFirmUserID = 0;
            question.dateTimeStamp = [[NSDate alloc] initWithTimeIntervalSinceNow:-10000];
            question.question = [NSString stringWithFormat:@"This is question #%i for Juror %i", question.questionID, question.jurorID];
            question.answer = [NSString stringWithFormat:@"This is answer #%i for Juror %i", question.questionID, question.jurorID];
            
            [questions addObject:question];
        }
        [jurorIDToJurorQuestions setObject:questions forKey:[NSNumber numberWithInt:juror.jurorID]];
    }
    success(questions);
}

@end
