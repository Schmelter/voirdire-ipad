//
//  VDDataModelEnums.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#ifndef Voir_Dire_VDDataModelEnums_h
#define Voir_Dire_VDDataModelEnums_h

typedef NS_ENUM(NSInteger, VDCaseForWhichParty) {
    VDCaseForWhichParty_Plaintiff,
    VDCaseForWhichParty_Defendant,
    VDCaseForWhichParty_Multiple,
    VDCaseForWhichParty_NA
};

typedef NS_ENUM(NSInteger, VDLitigationCategory) {
    VDLitigationCategory_Antitrust,
    VDLitigationCategory_Securities,
    VDLitigationCategory_Consumer,
    VDLitigationCategory_Other,
    VDLitigationCategory_NA
};

typedef NS_ENUM(NSInteger, VDVerdictInFavorOf) {
    VDVerdictInFavorOf_Plaintiff,
    VDVerdictInFavorOf_Defendant,
    VDVerdictInFavorOf_Multiple,
    VDVerdictInFavorOf_NA
};

typedef NS_ENUM(NSInteger, VDGender) {
    VDGender_Other,
    VDGender_Male,
    VDGender_Female
};

typedef NS_ENUM(NSInteger, VDRace) {
    VDRace_White,
    VDRace_Black,
    VDRace_AmericanIndian,
    VDRace_Asian,
    VDRace_PacificIslander,
    VDRace_HispanicLatino,
    VDRace_Other
};

typedef NS_ENUM(NSInteger, VDPrimaryRole) {
    VDPrimaryRole_Attorney,
    VDPrimaryRole_Associate,
    VDPrimaryRole_StaffAttorney,
    VDPrimaryRole_CaseManager,
    VDPrimaryRole_Paralegal,
    VDPrimaryRole_OfficeAdmin,
    VDPrimaryRole_IT,
    VDPrimaryRole_Observer,
    VDPrimaryRole_Other
};

typedef NS_ENUM(NSInteger, VDTrialPhase) {
    VDTrialPhase_VoirDire,
    VDTrialPhase_OpeningArgs,
    VDTrialPhase_EvidencePresentation,
    VDTrialPhase_ClosingArgs,
    VDTrialPhase_Other
};

typedef NS_ENUM(NSInteger, VDMaritalStatus) {
    VDMaritalStatus_Single,
    VDMaritalStatus_Married,
    VDMaritalStatus_Widowed,
    VDMaritalStatus_Divorced,
    VDMaritalStatus_Other
};

typedef NS_ENUM(NSInteger, VDReligion) {
    VDReligion_Christianity,
    VDReligion_Islam,
    VDReligion_Hinduism,
    VDReligion_Buddhism,
    VDReligion_Judaism,
    VDReligion_NonReligious,
    VDReligion_Other
};

typedef NS_ENUM(NSInteger, VDEducation) {
    VDEducation_NonGrad,
    VDEducation_HighSchool,
    VDEducation_Associates,
    VDEducation_Bachelors,
    VDEducation_Masters,
    VDEducation_PhD
};

typedef NS_ENUM(NSInteger, VDSexualOrientation) {
    VDSexualOrientation_Straight,
    VDSexualOrientation_Lesbian,
    VDSexualOrientation_Gay,
    VDSexualOrientation_Bisexual,
    VDSexualOrientation_Transgender,
    VDSexualOrientation_Other
};

#endif
