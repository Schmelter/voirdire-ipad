//
//  VDNotificationManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDNotification.h"
#import "VDLawFirmUser.h"

@interface VDNotificationManager : NSObject

+(void)pendingNotificationsForUser:(VDLawFirmUser*)user WithSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure;

@end
