//
//  VDTrialCaseManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDLawFirmUser.h"
#import "VDTrialCase.h"
#import "VDTrialCaseNote.h"

@interface VDTrialCaseManager : NSObject

+(void)trialCasesForUser:(VDLawFirmUser*)user withSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure;

@end
