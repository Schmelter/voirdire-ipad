//
//  VDVoirDireViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDVoirDireViewController.h"
#import "VDJuryPoolViewController.h"

@interface VDVoirDireViewController ()

@property (nonatomic, readwrite, weak) IBOutlet VDJuryPoolViewController *juryPoolVC;

@end

@implementation VDVoirDireViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedVDJuryPoolViewControllerSegue"]) {
        self.juryPoolVC = segue.destinationViewController;
        self.juryPoolVC.trialCase = self.trialCase;
        self.juryPoolVC.voirDireVC = self;
    }
}

@end
