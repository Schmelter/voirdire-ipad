//
//  VDHomeViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import <UIKit/UIKit.h>
#import "VDTrialCase.h"

@interface VDHomeViewController : VDViewController

-(void)displayCase:(VDTrialCase*)trialCase;

@end
