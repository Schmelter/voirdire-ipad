//
//  VDJuror.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDDataModelEnums.h"

@interface VDJuror : NSObject {
    @private
}

@property (nonatomic, readwrite, strong) NSString *jurorNumber, *nameLast, *nameFirst, *nameMiddle, *nameSuffix, *address, *city, *zipCode, *occupation;
@property (nonatomic, readwrite) NSInteger jurorID, trialCaseID, annualIncome, numberOfChildren, previousJurorID;
@property (nonatomic, readwrite, strong) NSDate *dateOfBirth;
@property (nonatomic, readwrite) VDGender gender;
@property (nonatomic, readwrite) VDMaritalStatus maritalStatus;
@property (nonatomic, readwrite) VDRace race;
@property (nonatomic, readwrite) VDReligion religion;
@property (nonatomic, readwrite) VDEducation education;
@property (nonatomic, readwrite) VDSexualOrientation sexualOrientation;

@end
