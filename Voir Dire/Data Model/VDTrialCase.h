//
//  VDTrialCase.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VDTrialCase_CaseForWhichParty) {
    VDTrialCase_CaseForWhichParty_Plaintiff,
    VDTrialCase_CaseForWhichParty_Defendant,
    VDTrialCase_CaseForWhichParty_Multiple,
    VDTrialCase_CaseForWhichParty_NA
};

typedef NS_ENUM(NSInteger, VDTrialCase_LitigationCategory) {
    VDTrialCase_LitigationCategory_Antitrust,
    VDTrialCase_LitigationCategory_Securities,
    VDTrialCase_LitigationCategory_Consumer,
    VDTrialCase_LitigationCategory_Other,
    VDTrialCase_LitigationCategory_NA
};

typedef NS_ENUM(NSInteger, VDTrialCase_VerdictInFavorOf) {
    VDTrialCase_VerdictInFavorOf_Plaintiff,
    VDTrialCase_VerdictInFavorOf_Defendant,
    VDTrialCase_VerdictInFavorOf_Multiple,
    VDTrialCase_VerdictInFavorOf_NA
};

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
