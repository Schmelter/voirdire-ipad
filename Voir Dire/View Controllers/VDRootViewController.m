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

/**
 * The SlideAmount object represents how much to slide the interface up when the keyboard is shown.
 */
@interface SlideAmount : NSObject

@property (nonatomic, strong) NSNumber *portraitAmount;
@property (nonatomic, strong) NSNumber *landscapeAmount;

@end



@interface VDRootViewController ()

@property (nonatomic, readwrite, strong) VDStartupPageViewController *startupVC;
@property (nonatomic, readwrite, strong) VDLoginViewController *loginVC;

@property (nonatomic, strong) NSMutableDictionary *slideForInputDict;

@end


@implementation VDRootViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            self.loginVC = nil;
            instance = self;
        });
    }
    return instance;
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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

#pragma mark - Slide for Keyboard functions
-(void)setSlideForInput:(id)sender portraitAmount:(NSNumber*)portraitAmount landscapeAmount:(NSNumber*)landscapeAmount {
    if (!_slideForInputDict) {
        self.slideForInputDict = [[NSMutableDictionary alloc] init];
    }
    
    SlideAmount *slideAmount = [[SlideAmount alloc] init];
    slideAmount.portraitAmount = portraitAmount;
    slideAmount.landscapeAmount = landscapeAmount;
    
    [_slideForInputDict setObject:slideAmount forKey:[NSValue valueWithNonretainedObject:sender]];
}

-(void)slideForInput:(id)sender {
    SlideAmount *slideAmount = [_slideForInputDict objectForKey:[NSValue valueWithNonretainedObject:sender]];
    NSLog(@"Root View Frame: %@", NSStringFromCGRect(self.view.frame));
    if (slideAmount) {
        CGRect rect = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
        if (self.interfaceOrientation == UIDeviceOrientationPortrait) {
            rect.origin.y = [slideAmount.portraitAmount integerValue];
        } else if (self.interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
            rect.origin.y = -([slideAmount.portraitAmount integerValue]);
        } else if (self.interfaceOrientation == UIDeviceOrientationLandscapeRight) {
            rect.origin.x = [slideAmount.landscapeAmount integerValue];
        } else if (self.interfaceOrientation == UIDeviceOrientationLandscapeLeft) {
            rect.origin.x = -([slideAmount.landscapeAmount integerValue]);
        }
        
        if (rect.origin.x == self.view.frame.origin.x && rect.origin.y == self.view.frame.origin.y) {
            return;
        }
        
        [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseInOut animations:^{
            self.view.frame = rect;
        } completion:nil];
    }
    NSLog(@"Root View Frame: %@", NSStringFromCGRect(self.view.frame));
}

-(void)unSlideForInput {
    // Slide down the view if the view is slid up
    __block CGRect rect = self.view.frame;
    NSLog(@"Root View Frame: %@", NSStringFromCGRect(self.view.frame));
    if (rect.origin.y != 0 || rect.origin.x != 0) {
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveEaseInOut animations:^{
            rect.origin.y = 0;
            rect.origin.x = 0;
            self.view.frame = rect;
        } completion:nil];
    }
    NSLog(@"Root View Frame: %@", NSStringFromCGRect(self.view.frame));
}
#pragma mark ---

+(VDRootViewController*)getInstance {
    return instance;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kVDNotificationLogoutPressed
                                                  object:nil];
}

@end


@implementation SlideAmount

@end
