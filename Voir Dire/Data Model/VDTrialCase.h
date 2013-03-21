//
//  VDTrialCase.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDDataModelEnums.h"

@interface VDTrialCase : NSObject {
    @private
}

@property (nonatomic, readwrite, strong) NSString *caseName, *caseNumber, *docketNumber, *plaintiffNames, *defendantNames, *trialVenue, *trialCounty, *trialJudge, *attyOfRecPlaintiff, *attyOfRecDefendant, *verdictFindings, *verdictTerms;
@property (nonatomic, readwrite, strong) NSDate *complaintDate, *jurySelectionDate, *openingArgumentDate, *closingArgumentDate, *verdictDate;
@property (nonatomic, readwrite) NSInteger trialCaseID, juryPoolSize, juryBoxSize, peremptoryStrikesAllowed;
@property (nonatomic, readwrite) BOOL isClassAction, isUserAllowed;
@property (nonatomic, readwrite) float verdictAmount;
@property (nonatomic, readwrite) VDCaseForWhichParty caseForWhichParty;
@property (nonatomic, readwrite) VDLitigationCategory litigationCategory;
@property (nonatomic, readwrite) VDVerdictInFavorOf verdictInFavorOf;

@property (nonatomic, readwrite) NSArray *trialCaseNotes;


@end
