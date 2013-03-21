//
//  VDTrialCase.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDTrialCase.h"

@implementation VDTrialCase

-(id)init {
    self = [super init];
    if (self) {
        self.caseForWhichParty = VDCaseForWhichParty_NA;
        self.litigationCategory = VDLitigationCategory_NA;
        self.verdictInFavorOf = VDVerdictInFavorOf_NA;
    }
    return self;
}

@end
