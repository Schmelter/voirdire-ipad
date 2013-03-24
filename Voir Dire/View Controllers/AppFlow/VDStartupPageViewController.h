//
//  VDStartupPageViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDRootViewController.h"

@interface VDStartupPageViewController : UIViewController

@property (nonatomic, readwrite, weak) VDRootViewController *rootVC;


-(void)presentVDViewController:(VDViewController*)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

@end
