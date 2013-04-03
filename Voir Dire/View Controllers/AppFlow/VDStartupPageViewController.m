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
#import "VDBackHandleButton.h"
#import "VDHomeHandleButton.h"

@interface VDStartupPageViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UINavigationController *navigationController;
@property (nonatomic, readwrite, weak) IBOutlet UIButton *forwardButton;
@property (nonatomic, readwrite, weak) IBOutlet VDBackHandleButton *backButton;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *titleLabel;

-(IBAction)forwardPressed:(id)sender;
-(void)backPressed;
-(void)homePressed;

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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"AppFlow" bundle:nil];
    VDHomeViewController *homeViewController = [storyboard instantiateViewControllerWithIdentifier:@"VDHomeViewController"];
    [self presentVDViewController:homeViewController animated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(backPressed)
                                                 name:kVDNotificationBackPressed
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(homePressed)
                                                 name:kVDNotificationHomePressed
                                               object:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"EmbedUINavigationControllerSegue" isEqualToString:segue.identifier]) {
        self.navigationController = segue.destinationViewController;
        self.navigationController.delegate = self;
    }
}

-(void)presentVDViewController:(VDViewController*)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    viewControllerToPresent.startupViewController = self;
    [_navigationController pushViewController:viewControllerToPresent animated:flag];
    if (completion) {
        completion();
    }
}

-(IBAction)forwardPressed:(id)sender {
    
}

-(void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)homePressed {
    __block VDHomeViewController *homeVC;
    [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(VDViewController* viewController, NSUInteger idx, BOOL *stop) {
        if ([viewController isKindOfClass:([VDHomeViewController class])]) {
            homeVC = (VDHomeViewController*) viewController;
            *stop = YES;
        }
    }];
    [self.navigationController popToViewController:homeVC animated:YES];
}

#pragma mark - UINavigationControllerDelegate methods

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController.navigationItem != nil) {
        self.titleLabel.text = viewController.navigationItem.title;
    }
}

#pragma mark ---

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kVDNotificationBackPressed
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kVDNotificationHomePressed
                                                  object:nil];
}

@end
