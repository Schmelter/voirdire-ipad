//
//  VDCurrentLawFirmUserManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDCurrentLawFirmUserManager.h"

static VDCurrentLawFirmUserManager *instance = nil;

@implementation VDCurrentLawFirmUserManager

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

-(void)currentUserWithSuccessHandler:(void(^)(VDLawFirmUser*))success withFailure:(void(^)(NSError*))failure {
    static VDLawFirmUser *currentUser = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        currentUser = [[VDLawFirmUser alloc] init];
        currentUser.lawFirmUserID = 1;
        currentUser.lawFirmID = 1;
        currentUser.login = @"ExampleUser";
        currentUser.passwordHash = @"passwordHash";
        currentUser.nameFirst = @"Example";
        currentUser.nameLast = @"User";
        currentUser.address = @"Example Address";
        currentUser.city = @"Example City";
        currentUser.zipCode = @"80124";
        currentUser.emailAddress = @"example@example.com";
        currentUser.dateOfBirth = [[NSDate alloc] initWithTimeIntervalSinceNow:-10000];
        currentUser.gender = VDGender_Male;
        currentUser.race = VDRace_White;
        currentUser.primaryRole = VDPrimaryRole_Attorney;
    });
    
    success(currentUser);
}

@end
