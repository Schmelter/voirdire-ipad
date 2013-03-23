//
//  VDNotificationCell.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDNotification.h"

@interface VDNotificationCell : UITableViewCell

@property (nonatomic, readwrite, strong) VDNotification *notification;

@end
