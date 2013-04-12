//
//  VDQuickQuestionsViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsViewController.h"
#import "VDQuickQuestionsQuestionTab.h"
#import "VDQuickQuestionsQuestionViewController.h"
#import "VDCompoundQuickQuestion.h"

@interface VDQuickQuestionsViewController ()

@property (nonatomic, weak) IBOutlet VDQuickQuestionsTabBar *tabBar;
@property (nonatomic, weak) UITabBarController *subTabBarController;

-(void)updateView:(BOOL)selectLastTab;

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
    
    [self updateView:NO];
}

-(void)updateView:(BOOL)selectLastTab {
    [_quickQuestions enumerateObjectsUsingBlock:^(VDCompoundQuickQuestion *quickQuestion, NSUInteger idx, BOOL *stop) {
        if ([[self.tabBar questionTabs] count] <= idx) {
            VDQuickQuestionsQuestionTab *newTab = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsQuestionTab" owner:nil options:nil] objectAtIndex:0];
            newTab.questionLabel.text = [NSString stringWithFormat:@"%i", quickQuestion.quickQuestion.quickQuestionID];
            [self.tabBar addQuestionTab:newTab];
        }
        
        if ([[self.subTabBarController viewControllers] count] <= idx) {
            VDQuickQuestionsQuestionViewController *questionVC = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsQuestionViewController" owner:nil options:nil] objectAtIndex:0];
            questionVC.quickQuestion = quickQuestion;
            [self.subTabBarController addChildViewController:questionVC];
            [questionVC didMoveToParentViewController:self.subTabBarController];
        }
    }];
    
    if (selectLastTab) {
        self.tabBar.selectedTab = ((VDQuickQuestionsQuestionTab*)[[self.tabBar questionTabs] lastObject]);
    }
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
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar didSelectTab:(VDQuickQuestionsQuestionTab*)selectedTab {
    _voirDireVC.quickQuestionsHidden = NO;
    NSInteger index = [_tabBar.questionTabs indexOfObject:selectedTab];
    self.subTabBarController.selectedIndex = index;
}

-(void)addQuestionPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar {
    _voirDireVC.quickQuestionsHidden = NO;
    
    VDCompoundQuickQuestion *quickQuestion = [[VDCompoundQuickQuestion alloc] init];
    quickQuestion.quickQuestion = [[VDQuickQuestion alloc] init];
    quickQuestion.jurorToQuickQuestions = [[NSMutableArray alloc] initWithCapacity:5];
    quickQuestion.quickQuestion.quickQuestionID = [_quickQuestions count];
    [_quickQuestions addObject:quickQuestion];
    [self updateView:YES];
    
    //_tabBar.selectedTab = newTab;
}
#pragma mark ---

-(void)setQuickQuestions:(NSMutableArray *)quickQuestions {
    _quickQuestions = quickQuestions;
    [self updateView:NO];
}

@end
