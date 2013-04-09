//
//  VDQuickQuestionsViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsViewController.h"

@interface VDQuickQuestionsViewController ()

@property (nonatomic, weak) IBOutlet VDQuickQuestionsTabBar *tabBar;

@end

@implementation VDQuickQuestionsViewController

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

#pragma mark - VDQuickQuestionsTabBarDelegate methods
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar didSelectTab:(VDQuickQuestionsJurorTab*)selectedTab {
    
}

-(void)addJurorPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar {
    
}
#pragma mark ---

@end
