//
//  VDHomeViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDHomeViewController.h"
#import "VDCaseListViewController.h"
#import "VDTrialCaseManager.h"
#import "VDCurrentLawFirmUserManager.h"
#import "VDCaseDetailsViewController.h"

@interface VDHomeViewController ()

@property (nonatomic, readwrite, weak) IBOutlet VDCaseListViewController *caseListVC;
@property (nonatomic, readwrite, weak) IBOutlet VDCaseDetailsViewController *caseDetailsVC;

@end

@implementation VDHomeViewController

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
    // Get the current user
    [VDCurrentLawFirmUserManager currentUserWithSuccessHandler:^(VDLawFirmUser* currentUser){
        [VDTrialCaseManager trialCasesForUser:currentUser withSuccessHandler:^(NSArray *trialCases){
            self.caseListVC.caseList = trialCases;
        } withFailure:^(NSError *error) {
            
        }];
    } withFailure:^(NSError *error){
        
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedVDCaseListViewControllerSegue"]) {
        self.caseListVC = segue.destinationViewController;
        self.caseListVC.homeVC = self;
    } else if ([segue.identifier isEqualToString:@"EmbedVDCaseDetailsViewControllerSegue"]) {
        self.caseDetailsVC = segue.destinationViewController;
        self.caseDetailsVC.homeVC = self;
    }
}

@end
