//
//  VDJurorToAvatar.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/27/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorToAvatar.h"
#import "VDDataModelEnums.h"

@implementation VDJurorToAvatar

-(id)init {
    self = nil;
    return nil;
}

+(UIImage*)jurorToAvatar:(VDJuror*)juror {
    UIImage *avatarImage = [UIImage imageNamed:@"avatar_luchadore_green"];
    
    if (juror.gender == VDGender_Female) {
        switch (juror.race) {
            case VDRace_White:
            case VDRace_Black:
                avatarImage = [UIImage imageNamed:@"avatar_black_female"];
                break;
            case VDRace_AmericanIndian:
                avatarImage = [UIImage imageNamed:@"avatar_americanindian_female"];
                break;
            case VDRace_Asian:
                avatarImage = [UIImage imageNamed:@"avatar_asian_female"];
                break;
            case VDRace_PacificIslander:
                avatarImage = [UIImage imageNamed:@"avatar_pacificislander_female"];
                break;
            case VDRace_HispanicLatino:
                avatarImage = [UIImage imageNamed:@"avatar_latino_female"];
                break;
            case VDRace_Other:
                avatarImage = [UIImage imageNamed:@"avatar_luchadore_red"];
                break;
        }
    } else if (juror.gender == VDGender_Male) {
        switch (juror.race) {
            case VDRace_White:
            case VDRace_Black:
                avatarImage = [UIImage imageNamed:@"avatar_black_male"];
                break;
            case VDRace_AmericanIndian:
                avatarImage = [UIImage imageNamed:@"avatar_americanindian_male"];
                break;
            case VDRace_Asian:
                avatarImage = [UIImage imageNamed:@"avatar_asian_male"];
                break;
            case VDRace_PacificIslander:
                avatarImage = [UIImage imageNamed:@"avatar_pacificislander_male"];
                break;
            case VDRace_HispanicLatino:
                avatarImage = [UIImage imageNamed:@"avatar_latino_male"];
                break;
            case VDRace_Other:
                avatarImage = [UIImage imageNamed:@"avatar_luchadore_blue"];
                break;
        }
    } else if (juror.gender == VDGender_Other) {
        
    }
    
    return avatarImage;
}

@end
