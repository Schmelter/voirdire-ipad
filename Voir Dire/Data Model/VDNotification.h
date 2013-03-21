//
//  VDNotification.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VDNotification : NSObject {
    @private
}

@property (nonatomic, readwrite) NSInteger notificationID;
@property (nonatomic, readwrite, strong) NSString *notification;
@property (nonatomic, readwrite, strong) NSDate *date;

@end
