//
//  VDJurorManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorManager.h"
#import <stdlib.h>
#import "VDJurorNote.h"


static NSMutableDictionary *trialCaseIDToJurors = nil;

@implementation VDJurorManager

-(id)init {
    return nil;
}

+(void)jurorsForTrialCase:(VDTrialCase*)trialCase withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*))failure {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        trialCaseIDToJurors = [[NSMutableDictionary alloc] initWithCapacity:5];
    });
    
    NSMutableArray *jurors = [trialCaseIDToJurors objectForKey:[NSNumber numberWithInt:trialCase.trialCaseID]];
    if (jurors == nil) {
        jurors = [[NSMutableArray alloc] initWithCapacity:trialCase.juryPoolSize];
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
            
            NSInteger jurorGender = arc4random() % 3;
            if (jurorGender == 0) {
                juror.gender = VDGender_Male;
            } else if (jurorGender == 1) {
                juror.gender = VDGender_Female;
            } else if (jurorGender == 2) {
                juror.gender = VDGender_Other;
            }
            juror.maritalStatus = VDMaritalStatus_Married;
            
            NSInteger jurorRace = arc4random() % 7;
            switch (jurorRace) {
                case 0:
                    juror.race = VDRace_White;
                    break;
                case 1:
                    juror.race = VDRace_Black;
                    break;
                case 2:
                    juror.race = VDRace_AmericanIndian;
                    break;
                case 3:
                    juror.race = VDRace_Asian;
                    break;
                case 4:
                    juror.race = VDRace_PacificIslander;
                    break;
                case 5:
                    juror.race = VDRace_HispanicLatino;
                    break;
                    case 6:
                    juror.race = VDRace_Other;
                    break;
            }
            
            juror.religion = VDReligion_Christianity;
            juror.education = VDEducation_Bachelors;
            juror.sexualOrientation = VDSexualOrientation_Straight;
            juror.rating = arc4random() % 6;
            
            NSInteger noteCount = (arc4random() % 20) + 1;
            NSMutableArray *jurorNotes = [[NSMutableArray alloc] initWithCapacity:noteCount];
            for (NSInteger i = 0; i < noteCount; i++) {
                VDJurorNote *note = [[VDJurorNote alloc] init];
                note.jurorNoteID = i;
                note.jurorNoteID = juror.jurorID;
                note.trialCaseID = juror.trialCaseID;
                note.dateTimeStamp = [NSDate dateWithTimeIntervalSinceNow:-50000];
                note.notes = [NSString stringWithFormat:@"Example Note #%i", i];
                
                [jurorNotes addObject:note];
            }
            juror.jurorNotes = jurorNotes;
            
            [jurors addObject:juror];
        }
        [trialCaseIDToJurors setObject:jurors forKey:[NSNumber numberWithInt:trialCase.trialCaseID]];
    }
    success(jurors);
}

@end
