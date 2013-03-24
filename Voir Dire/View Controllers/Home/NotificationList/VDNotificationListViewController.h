//
//  VDNotificationListViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDHomeViewController.h"

@interface VDNotificationListViewController : VDViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readwrite, weak) VDHomeViewController *homeVC;

@end
