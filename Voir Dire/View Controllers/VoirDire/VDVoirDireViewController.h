//
//  VDVoirDireViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDTrialCase.h"

@interface VDVoirDireViewController : VDViewController

@property (nonatomic, readwrite, strong) VDTrialCase *trialCase;

@end
