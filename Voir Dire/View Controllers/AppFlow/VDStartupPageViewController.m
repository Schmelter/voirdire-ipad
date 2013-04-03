//
//  VDStartupPageViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDStartupPageViewController.h"
#import "VDHomeViewController.h"
#import "VDRootViewController.h"

@interface VDStartupPageViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UIButton *forwardButton;
@property (nonatomic, readwrite, weak) IBOutlet UIButton *backButton;

-(IBAction)forwardPressed:(id)sender;
-(IBAction)backPressed:(id)sender;
-(IBAction)homePressed:(id)sender;

@end

@implementation VDStartupPageViewController

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
    
    _forwardButton.enabled = NO;
    _backButton.enabled = NO;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
    VDHomeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"VDHomeViewController"];
    [self presentVDViewController:homeViewController animated:YES completion:nil];
}

-(void)presentVDViewController:(VDViewController*)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    viewControllerToPresent.startupViewController = self;
    [self pushViewController:viewControllerToPresent animated:flag];
    if (completion) {
        completion();
    }
}

-(IBAction)forwardPressed:(id)sender {
    
}

-(IBAction)backPressed:(id)sender {
    
}

-(IBAction)homePressed:(id)sender {

}

@end
