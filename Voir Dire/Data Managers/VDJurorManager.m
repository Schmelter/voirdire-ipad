//
//  VDJurorManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorManager.h"

static VDJurorManager *instance = nil;

@implementation VDJurorManager

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

-(void)jurorsForTrialCase:(VDTrialCase*)trialCase withSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure {
    NSMutableArray *jurors = [[NSMutableArray alloc] initWithCapacity:trialCase.juryPoolSize];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        for (int i = 1; i < trialCase.juryPoolSize+1; i++) {
            VDJuror *juror = [[VDJuror alloc] init];
            
            juror.jurorNumber = [NSString stringWithFormat:@"%i", i];
            juror.nameLast = @"Example Last";
            juror.nameFirst = @"Example First";
            juror.nameMiddle = @"Example Middle";
            juror.address = @"Example Address";
            juror.city = @"Example City";
            juror.zipCode = @"80124";
            juror.occupation = @"Example Occupation";
            juror.jurorID = i;
            juror.trialCaseID = trialCase.trialCaseID;
            juror.annualIncome = i * 10000;
            juror.numberOfChildren = i;
            juror.previousJurorID = i - 1;
            juror.dateOfBirth = [NSDate dateWithTimeIntervalSinceNow:-100000];
            juror.gender = VDGender_Male;
            juror.maritalStatus = VDMaritalStatus_Married;
            juror.race = VDRace_White;
            juror.religion = VDReligion_Christianity;
            juror.education = VDEducation_Bachelors;
            juror.sexualOrientation = VDSexualOrientation_Straight;
            
            [jurors addObject:juror];
        }
    });
    
    success(jurors);
}

@end
