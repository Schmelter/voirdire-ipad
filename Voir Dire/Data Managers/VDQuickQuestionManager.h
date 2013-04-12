//
//  VDQuickQuestionManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDQuickQuestion.h"
#import "VDJuror.h"
#import "VDTrialCase.h"

@interface VDQuickQuestionManager : NSObject

+(void)quickQuestionsForTrialCase:(VDTrialCase*)trialCase withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure;

@end
