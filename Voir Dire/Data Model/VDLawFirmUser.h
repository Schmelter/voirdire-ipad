//
//  VDLawFirmUser.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VDLawFirmUser_Gender) {
    VDLawFirmUser_Gender_Other,
    VDLawFirmUser_Gender_Male,
    VDLawFirmUser_Gender_Female
};

typedef NS_ENUM(NSInteger, VDLawFirmUser_Race) {
    VDLawFirmUser_Race_White,
    VDLawFirmUser_Race_Black,
    VDLawFirmUser_Race_AmericanIndian,
    VDLawFirmUser_Race_Asian,
    VDLawFirmUser_Race_PacificIslander,
    VDLawFirmUser_Race_HispanicLatino,
    VDLawFirmUser_Race_Other
};

typedef NS_ENUM(NSInteger, VDLawFirmUser_PrimaryRole) {
    VDLawFirmUser_PrimaryRole_Attorney,
    VDLawFirmUser_PrimaryRole_Associate,
    VDLawFirmUser_PrimaryRole_StaffAttorney,
    VDLawFirmUser_PrimaryRole_CaseManager,
    VDLawFirmUser_PrimaryRole_Paralegal,
    VDLawFirmUser_PrimaryRole_OfficeAdmin,
    VDLawFirmUser_PrimaryRole_IT,
    VDLawFirmUser_PrimaryRole_Observer,
    VDLawFirmUser_PrimaryRole_Other
};

@interface VDLawFirmUser : NSObject {
    @private
}

@property (nonatomic, readwrite, strong) NSString *login, *passwordHash, *nameFirst, *nameLast, *nameMiddle, *nameSuffix, *address, *city, *zipCode, *emailAddress;
@property (nonatomic, readwrite) NSInteger lawFirmUserID, lawFirmID;
@property (nonatomic, readwrite, strong) NSDate *dateOfBirth;
@property (nonatomic, readwrite) VDLawFirmUser_Gender gender;
@property (nonatomic, readwrite) VDLawFirmUser_Race race;
@property (nonatomic, readwrite) VDLawFirmUser_PrimaryRole primaryRole;



@end
