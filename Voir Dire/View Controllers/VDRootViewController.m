//
//  VDRootViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDRootViewController.h"
#import "VDStartupPageViewController.h"
#import "VDLoginViewController.h"
#import "VDLogoutHandleButton.h"

static VDRootViewController *instance = nil;

@interface VDRootViewController ()

@property (nonatomic, readwrite, strong) VDStartupPageViewController *startupVC;
@property (nonatomic, readwrite, strong) VDLoginViewController *loginVC;

@end


@implementation VDRootViewController

-(id)init {
    self = [super init];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.loginVC = nil;
            instance = self;
        });
    }
    return instance;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(presentLoginViewController)
                                                 name:kVDNotificationLogoutPressed
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.startupVC = [UIStoryboard storyboardWithName:@"AppFlow" bundle:[NSBundle mainBundle]].instantiateInitialViewController;
    self.startupVC.rootVC = self;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self addChildViewController:self.startupVC];
        [self.view addSubview:self.startupVC.view];
        [self.startupVC didMoveToParentViewController:self];
        //[self presentViewController:loginNC animated:NO completion:nil];
    });
    
    
    
    // Check if the user is logged in.  If not, then ask them to log in here.
    [self presentLoginViewController];
}

-(void)presentLoginViewController {
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

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kVDNotificationLogoutPressed
                                                  object:nil];
}

@end
