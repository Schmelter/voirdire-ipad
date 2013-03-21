//
//  VDRootViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDRootViewController.h"
#import "VDLoginViewController.h"

@interface VDRootViewController ()

@property (nonatomic, readwrite, strong) VDLoginViewController *loginVC;

@end


@implementation VDRootViewController

-(id)init {
    self = [super init];
    if (self) {
        self.loginVC = nil;
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    VDViewController *loginVC = [UIStoryboard storyboardWithName:@"AppFlow" bundle:[NSBundle mainBundle]].instantiateInitialViewController;
    UINavigationController *loginNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    loginNC.navigationBarHidden = YES;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self addChildViewController:loginNC];
        [self.view addSubview:loginNC.view];
        [loginNC didMoveToParentViewController:self];
        //[self presentViewController:loginNC animated:NO completion:nil];
    });
    
    
    
    // Check if the user is logged in.  If not, then ask them to log in here.
    self.loginVC = [[VDLoginViewController alloc] initWithNibName:@"VDLoginViewController" bundle:nil];
    self.loginVC.rootViewController = self;
    [self addChildViewController:self.loginVC];
    [self.view addSubview:self.loginVC.view];
    [self.loginVC didMoveToParentViewController:self];
}

-(void)viewWillAppear:(BOOL)animated {
}

-(void)dismissLoginViewController {
    [self.loginVC willMoveToParentViewController:nil];
    [self.loginVC.view removeFromSuperview];
    [self.loginVC removeFromParentViewController];
}

@end
