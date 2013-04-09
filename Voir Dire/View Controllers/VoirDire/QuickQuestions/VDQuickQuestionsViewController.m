//
//  VDQuickQuestionsViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsViewController.h"
#import "VDQuickQuestionsJurorTab.h"
#import "VDQuickQuestionsQuestionViewController.h"

@interface VDQuickQuestionsViewController ()

@property (nonatomic, weak) IBOutlet VDQuickQuestionsTabBar *tabBar;
@property (nonatomic, strong) NSMutableArray *jurorTabs;
@property (nonatomic, weak) UITabBarController *subTabBarController;

@end

@implementation VDQuickQuestionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.jurorTabs = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        self.jurorTabs = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _tabBar.jurorTabs = self.jurorTabs;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedTabBarControllerSegue"]) {
        self.subTabBarController = segue.destinationViewController;
        
        // Move the tab bar off where it can't be seen
        NSInteger tabBarHeight = self.subTabBarController.tabBar.frame.size.height;
        [self.subTabBarController.view.subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop){
            if ([view isKindOfClass:[UITabBar class]]) {
                view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + tabBarHeight, view.frame.size.width, view.frame.size.height);
            } else {
                view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height + tabBarHeight);
            }
        }];
    }
}

#pragma mark - VDQuickQuestionsTabBarDelegate methods
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar didSelectTab:(VDQuickQuestionsJurorTab*)selectedTab {
    NSInteger index = [_tabBar.jurorTabs indexOfObject:selectedTab];
    self.subTabBarController.selectedIndex = index;
}

-(void)addJurorPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar {
    _voirDireVC.quickQuestionsHidden = NO;
    
    VDQuickQuestionsJurorTab *newTab = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsJurorTab" owner:nil options:nil] objectAtIndex:0];
    [self.jurorTabs addObject:newTab];
    _tabBar.jurorTabs = self.jurorTabs;
    
    VDQuickQuestionsQuestionViewController *questionVC = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsQuestionViewController" owner:nil options:nil] objectAtIndex:0];
    [self.subTabBarController addChildViewController:questionVC];
    
    _tabBar.selectedTab = newTab;
}
#pragma mark ---

@end
