//
//  VDTrialCaseManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDTrialCaseManager.h"

static VDTrialCaseManager *instance;

@implementation VDTrialCaseManager

-(id)init {
    self = [super init];
    static dispatch_once_t once;
    if (self) {
        dispatch_once(&once, ^{
            instance = self;
        });
    }
    return instance;
}

-(void)trialCasesForUser:(VDLawFirmUser*)user withSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure {
    static NSMutableArray *trialCases = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trialCases = [[NSMutableArray alloc] initWithCapacity:10];
        
        NSInteger trialCaseNoteID = 1;
        for (NSInteger i = 0; i < 10; i++) {
            VDTrialCase *trialCase = [[VDTrialCase alloc] init];
            
            trialCase.caseName = [NSString stringWithFormat:@"CaseName %i", i];
            trialCase.caseNumber = [NSString stringWithFormat:@"CaseNumber %i", i];
            trialCase.docketNumber = [NSString stringWithFormat:@"DocketNumber %i", i];
            trialCase.plaintiffNames = [NSString stringWithFormat:@"Plaintiff Names %i", i];
            trialCase.defendantNames = [NSString stringWithFormat:@"Defendant Name %i", i];
            trialCase.trialVenue = [NSString stringWithFormat:@"Trial Venue %i", i];
            trialCase.trialCounty = [NSString stringWithFormat:@"Trial Count %i", i];
            trialCase.trialJudge = [NSString stringWithFormat:@"Trial Judge %i", i];
            trialCase.attyOfRecDefendant = [NSString stringWithFormat:@"AttyOfRecDefendant %i", i];
            trialCase.verdictFindings = [NSString stringWithFormat:@"Verdict Findings %i", i];
            trialCase.verdictTerms = [NSString stringWithFormat:@"Verdict Terms %i", i];
            trialCase.complaintDate = [NSDate dateWithTimeIntervalSinceNow:-(100000 * 5)];
            trialCase.jurySelectionDate = [NSDate dateWithTimeIntervalSinceNow:-(100000 * 4)];
            trialCase.openingArgumentDate = [NSDate dateWithTimeIntervalSinceNow:-(100000 * 3)];
            trialCase.closingArgumentDate = [NSDate dateWithTimeIntervalSinceNow:-(100000 * 2)];
            trialCase.verdictDate = [NSDate dateWithTimeIntervalSinceNow:-(100000 * 1)];
            trialCase.trialCaseID = i;
            trialCase.juryPoolSize = 30;
            trialCase.juryBoxSize = 12;
            trialCase.peremptoryStrikesAllowed = 3;
            trialCase.isClassAction = NO;
            trialCase.isUserAllowed = YES;
            trialCase.verdictAmount = i * 100000;
            trialCase.caseForWhichParty = VDCaseForWhichParty_Defendant;
            trialCase.litigationCategory = VDLitigationCategory_Consumer;
            trialCase.verdictInFavorOf = VDVerdictInFavorOf_Defendant;
            
            NSMutableArray *trialCaseNotes = [[NSMutableArray alloc] initWithCapacity:5];
            for (NSInteger j = 0; j < 5; j++) {
                VDTrialCaseNote *trialCaseNote = [[VDTrialCaseNote alloc] init];
                
                trialCaseNote.trialCaseID = i;
                trialCaseNote.trialCaseNoteID = trialCaseNoteID++;
                trialCaseNote.lawFirmUserID = user.lawFirmUserID;
                trialCaseNote.dateTimeStamp = [NSDate dateWithTimeIntervalSinceNow:-10000];
                trialCaseNote.trialPhase = VDTrialPhase_VoirDire;
                trialCaseNote.notes = [NSString stringWithFormat:@"Trial Case Note %i for Trial Case %i", j, i];
                
                [trialCaseNotes addObject:trialCaseNote];
            }
            trialCase.trialCaseNotes = trialCaseNotes;
            
            [trialCases addObject:trialCase];
        }
    });
    
    success(trialCases);
}

@end
