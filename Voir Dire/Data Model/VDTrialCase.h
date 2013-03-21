//
//  VDTrialCase.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum VDTrialCase_CaseForWhichParty {
    VDTrialCase_CaseForWhichParty_Plaintiff = 1,
    VDTrialCase_CaseForWhichParty_Defendant = 2,
    VDTrialCase_CaseForWhichParty_Multiple = 3,
    VDTrialCase_CaseForWhichParty_NA = 0
} VDTrialCase_CaseForWhichParty;

typedef enum VDTrialCase_LitigationCategory {
    VDTrialCase_LitigationCategory_Antitrust = 1,
    VDTrialCase_LitigationCategory_Securities = 2,
    VDTrialCase_LitigationCategory_Consumer = 3,
    VDTrialCase_LitigationCategory_Other = 4,
    VDTrialCase_LitigationCategory_NA = 0
} VDTrialCase_LitigationCategory;

typedef enum VDTrialCase_VerdictInFavorOf {
    VDTrialCase_VerdictInFavorOf_Plaintiff = 1,
    VDTrialCase_VerdictInFavorOf_Defendant = 2,
    VDTrialCase_VerdictInFavorOf_Multiple = 3,
    VDTrialCase_VerdictInFavorOf_NA = 0
} VDTrialCase_VerdictInFavorOf;

@interface VDTrialCase : NSObject {
    @private
}

@property (nonatomic, readwrite, strong) NSString *caseName, *caseNumber, *docketNumber, *plaintiffNames, *defendantNames, *trialVenue, *trialCounty, *trialJudge, *attyOfRecPlaintiff, *attyOfRecDefendant, *verdictFindings, *verdictTerms;
@property (nonatomic, readwrite, strong) NSDate *complaintDate, *jurySelectionDate, *openingArgumentDate, *closingArgumentDate, *verdictDate;
@property (nonatomic, readwrite) NSInteger trialCaseID, juryPoolSize, juryBoxSize, peremptoryStrikesAllowed;
@property (nonatomic, readwrite) BOOL isClassAction, isUserAllowed;
@property (nonatomic, readwrite) float verdictAmount;
@property (nonatomic, readwrite) VDTrialCase_CaseForWhichParty caseForWhichParty;
@property (nonatomic, readwrite) VDTrialCase_LitigationCategory litigationCategory;
@property (nonatomic, readwrite) VDTrialCase_VerdictInFavorOf verdictInFavorOf;


@end
