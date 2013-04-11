//
//  VDJurorToQuickQuestion.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDJurorToQuickQuestion : NSObject

@property (nonatomic, readwrite) NSInteger jurorID, quickQuestionID;
@property (nonatomic, readwrite, strong) NSString *answer;

@end
