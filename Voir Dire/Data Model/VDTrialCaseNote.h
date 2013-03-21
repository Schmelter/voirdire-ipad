//
//  VDTrialCaseNote.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDDataModelEnums.h"

@interface VDTrialCaseNote : NSObject {
    @private
}

@property (nonatomic, readwrite) NSInteger trialCaseNoteID, trialCaseID, lawFirmUserID;
@property (nonatomic, readwrite, strong) NSDate *dateTimeStamp;
@property (nonatomic, readwrite) VDTrialPhase trialPhase;
@property (nonatomic, readwrite, strong) NSString *notes;

@end
