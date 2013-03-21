//
//  VDTrialCaseNote.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDTrialCaseNote.h"

@implementation VDTrialCaseNote

-(id)init {
    self = [super init];
    if (self) {
        self.trialPhase = VDTrialCaseNote_TrialPhase_Other;
    }
    return self;
}

@end
