//
//  VDNotificationManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDNotificationManager.h"

@implementation VDNotificationManager

-(id)init {
    return nil;
}

+(void)pendingNotificationsForUser:(VDLawFirmUser*)user WithSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure {
    static NSMutableArray *notifications = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notifications = [[NSMutableArray alloc] initWithCapacity:10];
        
        for (NSInteger i = 0; i < 10; i++) {
            VDNotification *notification = [[VDNotification alloc] init];
            
            notification.notificationID = i;
            notification.notification = [NSString stringWithFormat:@"Notification Number: %i", i];
            notification.date = [[NSDate alloc] initWithTimeIntervalSinceNow:-(10000 * i)];
            notification.hasBeenRead = NO;
            
            [notifications addObject:notification];
        }
    });
    
    success(notifications);
}

@end
