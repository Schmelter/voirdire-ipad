//
//  VDLawFirmUser.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDDataModelEnums.h"

@interface VDLawFirmUser : NSObject {
    @private
}

@property (nonatomic, readwrite, strong) NSString *login, *passwordHash, *nameFirst, *nameLast, *nameMiddle, *nameSuffix, *address, *city, *zipCode, *emailAddress;
@property (nonatomic, readwrite) NSInteger lawFirmUserID, lawFirmID;
@property (nonatomic, readwrite, strong) NSDate *dateOfBirth;
@property (nonatomic, readwrite) VDGender gender;
@property (nonatomic, readwrite) VDRace race;
@property (nonatomic, readwrite) VDPrimaryRole primaryRole;



@end
