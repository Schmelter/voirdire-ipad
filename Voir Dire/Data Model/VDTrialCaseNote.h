//
//  VDTrialCaseNote.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum VDTrialCaseNote_TrialPhase {
    VDTrialCaseNote_TrialPhase_VoirDire = 1,
    VDTrialCaseNote_TrialPhase_OpeningArgs = 2,
    VDTrialCaseNote_TrialPhase_EvidencePresentation = 3,
    VDTrialCaseNote_TrialPhase_ClosingArgs = 4,
    VDTrialCaseNote_TrialPhase_Other = 0
} VDTrialCaseNote_TrialPhase;

@interface VDTrialCaseNote : NSObject {
    @private
}

@property (nonatomic, readwrite) NSInteger trialCaseNoteID, trialCaseID, lawFirmUserID;
@property (nonatomic, readwrite, strong) NSDate *dateTimeStamp;
@property (nonatomic, readwrite) VDTrialCaseNote_TrialPhase trialPhase;
@property (nonatomic, readwrite, strong) NSString *notes;

@end
