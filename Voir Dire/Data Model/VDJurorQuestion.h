//
//  VDJurorQuestion.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDJurorQuestion : NSObject

@property (nonatomic, readwrite) NSInteger questionID, jurorID, lawFirmUserID;
@property (nonatomic, readwrite, strong) NSDate *dateTimeStamp;
@property (nonatomic, readwrite, strong) NSString *question, *answer;

@end
