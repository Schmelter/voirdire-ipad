//
//  VDLoginViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDRootViewController.h"

@interface VDLoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, readwrite, weak) VDRootViewController *rootViewController;

@end
