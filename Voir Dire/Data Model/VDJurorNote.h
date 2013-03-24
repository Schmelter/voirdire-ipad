//
//  VDJurorNote.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDJurorNote : NSObject

@property (nonatomic, readwrite) NSInteger jurorNoteID, jurorID, trialCaseID;
@property (nonatomic, readwrite, strong) NSDate *dateTimeStamp;
@property (nonatomic, readwrite, strong) NSString *notes;

@end
