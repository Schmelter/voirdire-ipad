//
//  VDCurrentLawFirmUserManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDLawFirmUser.h"

@interface VDCurrentLawFirmUserManager : NSObject

+(void)currentUserWithSuccessHandler:(void(^)(VDLawFirmUser*))success withFailure:(void(^)(NSError*))failure;

@end
