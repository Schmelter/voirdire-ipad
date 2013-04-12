//
//  VDVoirDireViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDVoirDireViewController.h"
#import "VDJuryPoolViewController.h"
#import "VDJurorNote.h"
#import"VDJurorDetailsViewController.h"
#import "VDJurorManager.h"
#import "VDQuickQuestionsViewController.h"
#import "VDQuickQuestionManager.h"

#define kQuickQuestionsHiddenHeight 50
#define kQuickQuestionsShownHeight 308

@interface VDVoirDireViewController ()

@property (nonatomic, readwrite, weak) IBOutlet VDJuryPoolViewController *juryPoolVC;
@property (nonatomic, readwrite, weak) IBOutlet VDJurorDetailsViewController *jurorDetailsVC;
@property (nonatomic, readwrite, weak) IBOutlet VDQuickQuestionsViewController *quickQuestionsVC;
@property (nonatomic, readwrite, weak) IBOutlet UIView *quickQuestionsContainer;

@end

@implementation VDVoirDireViewController

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
    [VDQuickQuestionManager quickQuestionsForTrialCase:_trialCase withSuccessHandler:^(NSMutableArray *quickQuestions){
        _quickQuestionsVC.quickQuestions = quickQuestions;
    } withFailure:^(NSError *error){
        
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedVDJuryPoolViewControllerSegue"]) {
        self.juryPoolVC = segue.destinationViewController;
        
        self.juryPoolVC.voirDireVC = self;
        [VDJurorManager jurorsForTrialCase:self.trialCase withSuccessHandler:^(NSMutableArray *jurors){
            self.juryPoolVC.jurors = jurors;
        } withFailure:^(NSError *error){
            
        }];
    } else if ([segue.identifier isEqualToString:@"EmbedVDQuickQuestionsViewControllerSegue"]) {
        self.quickQuestionsVC = segue.destinationViewController;
        self.quickQuestionsVC.voirDireVC = self;
    }
}

-(void)displayJurorDetails:(NSInteger)idx ForJurors:(NSMutableArray*)jurors {
    if (self.jurorDetailsVC == nil) {
        self.jurorDetailsVC = (VDJurorDetailsViewController*)[[[NSBundle mainBundle] loadNibNamed:@"VDJurorDetailsViewController" owner:self options:nil] objectAtIndex:0];
        self.jurorDetailsVC.delegate = self;
        [self addChildViewController:self.jurorDetailsVC];
        [self.view addSubview:self.jurorDetailsVC.view];
        CGRect detailsFrame = self.jurorDetailsVC.view.frame;
        self.jurorDetailsVC.view.frame = CGRectMake((self.view.frame.size.width / 2) - (detailsFrame.size.width/2), (self.view.frame.size.height / 2) - (detailsFrame.size.height / 2), detailsFrame.size.width, detailsFrame.size.height);
        [self.jurorDetailsVC didMoveToParentViewController:self];
    }
    self.jurorDetailsVC.jurors = jurors;
    self.jurorDetailsVC.jurorIdx = idx;
}

-(void)dismissJurorDetails {
    [self.jurorDetailsVC willMoveToParentViewController:nil];
    [self.jurorDetailsVC.view removeFromSuperview];
    [self.jurorDetailsVC removeFromParentViewController];
    self.jurorDetailsVC = nil;
}

#pragma mark - VDJurorDetailsViewDelegate Methods
-(void)jurorDetailsWillClose:(VDJurorDetailsViewController*)jurorDetailsVC; {
    [self dismissJurorDetails];
}
#pragma mark ---

-(void)setQuickQuestionsHidden:(BOOL)quickQuestionsHidden {
    _quickQuestionsHidden = quickQuestionsHidden;
    
    [UIView animateWithDuration:0.5 delay:0.1 options:(UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState) animations:^(void) {
        if (_quickQuestionsHidden) {
            self.quickQuestionsContainer.frame = CGRectMake(0, self.view.frame.size.height - kQuickQuestionsHiddenHeight, self.quickQuestionsContainer.frame.size.width, self.quickQuestionsContainer.frame.size.height);
        } else {
            self.quickQuestionsContainer.frame = CGRectMake(0, self.view.frame.size.height - kQuickQuestionsShownHeight, self.quickQuestionsContainer.frame.size.width, self.quickQuestionsContainer.frame.size.height);
        }
    } completion:nil];    
}

@end
