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
#import "VDCompoundQuickQuestion.h"

@interface VDQuickQuestionsViewController ()

@property (nonatomic, weak) IBOutlet VDQuickQuestionsTabBar *tabBar;
@property (nonatomic, weak) UITabBarController *subTabBarController;

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

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self updateView];
}

-(void)updateView {
    [[self.subTabBarController childViewControllers] enumerateObjectsUsingBlock:^(VDQuickQuestionsQuestionViewController *qqVC, NSUInteger idx, BOOL *stop){
        [qqVC removeFromParentViewController];
    }];
    
    NSMutableArray *jurorTabs = [[NSMutableArray alloc] initWithCapacity:_quickQuestions.count];
    [_quickQuestions enumerateObjectsUsingBlock:^(VDCompoundQuickQuestion *quickQuestion, NSUInteger idx, BOOL *stop) {
        VDQuickQuestionsJurorTab *newTab = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsJurorTab" owner:nil options:nil] objectAtIndex:0];
        newTab.jurorLabel.text = [NSString stringWithFormat:@"%i", quickQuestion.quickQuestion.quickQuestionID];
        [jurorTabs addObject:newTab];
        
        VDQuickQuestionsQuestionViewController *questionVC = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsQuestionViewController" owner:nil options:nil] objectAtIndex:0];
        questionVC.quickQuestion = quickQuestion;
        [self.subTabBarController addChildViewController:questionVC];
    }];
    
    
    
    _tabBar.jurorTabs = jurorTabs;
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
    _voirDireVC.quickQuestionsHidden = NO;
    NSInteger index = [_tabBar.jurorTabs indexOfObject:selectedTab];
    self.subTabBarController.selectedIndex = index;
}

-(void)addJurorPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar {
    _voirDireVC.quickQuestionsHidden = NO;
    
    VDCompoundQuickQuestion *quickQuestion = [[VDCompoundQuickQuestion alloc] init];
    quickQuestion.quickQuestion = [[VDQuickQuestion alloc] init];
    quickQuestion.jurorToQuickQuestions = [[NSMutableArray alloc] initWithCapacity:5];
    quickQuestion.quickQuestion.quickQuestionID = [_quickQuestions count];
    [_quickQuestions addObject:quickQuestion];
    [self updateView];
    
    //_tabBar.selectedTab = newTab;
}
#pragma mark ---

-(void)setQuickQuestions:(NSMutableArray *)quickQuestions {
    _quickQuestions = quickQuestions;
    [self updateView];
}

@end
