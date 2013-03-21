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
        self.caseForWhichParty = VDTrialCase_CaseForWhichParty_NA;
        self.litigationCategory = VDTrialCase_LitigationCategory_NA;
        self.verdictInFavorOf = VDTrialCase_VerdictInFavorOf_NA;
    }
    return self;
}

@end
