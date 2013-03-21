//
//  VDTrialCaseNote.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VDTrialCaseNote_TrialPhase) {
    VDTrialCaseNote_TrialPhase_VoirDire,
    VDTrialCaseNote_TrialPhase_OpeningArgs,
    VDTrialCaseNote_TrialPhase_EvidencePresentation,
    VDTrialCaseNote_TrialPhase_ClosingArgs,
    VDTrialCaseNote_TrialPhase_Other
};

@interface VDTrialCaseNote : NSObject {
    @private
}

@property (nonatomic, readwrite) NSInteger trialCaseNoteID, trialCaseID, lawFirmUserID;
@property (nonatomic, readwrite, strong) NSDate *dateTimeStamp;
@property (nonatomic, readwrite) VDTrialCaseNote_TrialPhase trialPhase;
@property (nonatomic, readwrite, strong) NSString *notes;

@end
