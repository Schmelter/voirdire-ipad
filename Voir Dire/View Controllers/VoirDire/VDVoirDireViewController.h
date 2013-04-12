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
#import "VDJuryPoolViewController.h"

@interface VDVoirDireViewController : VDViewController <VDJurorDetailsViewControllerDelegate, VDJuryPoolViewControllerDelegate>

@property (nonatomic, readwrite, strong) VDTrialCase *trialCase;
@property (nonatomic, readwrite) BOOL quickQuestionsHidden;

-(void)dismissJurorDetails;

@end
