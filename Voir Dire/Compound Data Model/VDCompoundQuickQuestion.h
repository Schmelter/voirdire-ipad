//
//  VDCompoundQuickQuestion.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDQuickQuestion.h"
#import "VDJurorToQuickQuestion.h"

@interface VDCompoundQuickQuestion : NSObject

@property (nonatomic, readwrite, strong) VDQuickQuestion *quickQuestion;
@property (nonatomic, readwrite, strong) NSArray *jurorToQuickQuestions;

@end
