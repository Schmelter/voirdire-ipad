//
//  VDViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDLoginViewController.h"

@interface VDViewController ()

@property (nonatomic, readwrite, strong) VDLoginViewController *loginVC;

@end

@implementation VDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.loginVC = nil;
    }
    return self;
}

-(void)viewDidLoad {
    
}

-(void)viewWillAppear:(BOOL)animated {
    // Check if the user is logged in.  If not, then ask them to log in here.
    self.loginVC = [[VDLoginViewController alloc] initWithNibName:@"VDLoginViewController" bundle:nil];
    self.loginVC.mainViewController = self;
    [self addChildViewController:self.loginVC];
    [self.view addSubview:self.loginVC.view];
    [self.loginVC didMoveToParentViewController:self];
}

-(void)dismissLoginViewController {
    [self.loginVC willMoveToParentViewController:nil];
    [self.loginVC.view removeFromSuperview];
    [self.loginVC removeFromParentViewController];
}


@end
