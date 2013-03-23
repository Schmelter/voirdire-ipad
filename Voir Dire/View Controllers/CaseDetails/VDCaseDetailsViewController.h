//
//  VDCaseDetailsViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDHomeViewController.h"
#import "VDTrialCase.h"

@interface VDCaseDetailsViewController : VDViewController

@property (nonatomic, readwrite, weak) VDHomeViewController *homeVC;
@property (nonatomic, readwrite, strong) VDTrialCase *trialCase;

@end
