//
//  VDLawFirmUser.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDLawFirmUser.h"

@implementation VDLawFirmUser

-(id)init {
    self = [super init];
    if (self) {
        self.gender = VDLawFirmUser_Gender_Other;
        self.race = VDLawFirmUser_Race_Other;
        self.primaryRole = VDLawFirmUser_PrimaryRole_Other;
    }
    return self;
}

@end
