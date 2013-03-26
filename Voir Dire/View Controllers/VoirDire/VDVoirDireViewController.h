//
//  VDVoirDireViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDTrialCase.h"
#import "VDJuror.h"
#import "VDJurorDetailsViewController.h"

@interface VDVoirDireViewController : VDViewController <VDJurorDetailsViewControllerDelegate>

@property (nonatomic, readwrite, strong) VDTrialCase *trialCase;

-(void)displayJurorDetails:(NSInteger)idx ForJurors:(NSMutableArray*)jurors;
-(void)dismissJurorDetails;

@end
