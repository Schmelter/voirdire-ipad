//
//  VDRootViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDRootViewController.h"

@interface VDRootViewController ()

@end


@implementation VDRootViewController

#pragma mark - View lifecycle

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    VDViewController *loginVC = [UIStoryboard storyboardWithName:@"AppFlow" bundle:[NSBundle mainBundle]].instantiateInitialViewController;
    UINavigationController *loginNC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    loginNC.navigationBarHidden = YES;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self presentViewController:loginNC animated:NO completion:nil];
    });
}

@end
