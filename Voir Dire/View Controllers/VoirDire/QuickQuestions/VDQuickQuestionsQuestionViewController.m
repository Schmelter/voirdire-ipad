//
//  VDQuickQuestionsQuestionViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsQuestionViewController.h"
#import "FXLabel.h"
#import <QuartzCore/QuartzCore.h>
#import "VDRootViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VDQuickQuestionsQuestionViewController ()

@property (nonatomic, readwrite, weak) IBOutlet FXLabel *questionNum;
@property (nonatomic, readwrite, weak) IBOutlet UITextView *questionText;
@property (nonatomic, readwrite, strong) UITapGestureRecognizer *dismissKeyboardTap;
@property (nonatomic, readwrite, strong) IBOutletCollection(UIButton) NSArray *answerButtons;
@property (nonatomic, readwrite, strong) UIButton *highlightedBtn;

-(void)updateView;
-(IBAction)dismissKeyboard:(id)sender;
-(IBAction)answerPressed:(id)sender;

@end

@implementation VDQuickQuestionsQuestionViewController

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
        self.dismissKeyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard:)];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.dismissKeyboardTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard:)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.;
    
    [self updateView];
    
    VDRootViewController *rootVC = [VDRootViewController getInstance];
    [rootVC setSlideForInput:self.questionText portraitAmount:[NSNumber numberWithFloat:-300.0] landscapeAmount:[NSNumber numberWithFloat:-300.0]];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIButton *answerOne = (UIButton*)[_answerButtons objectAtIndex:0];
    [answerOne setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    //[answerOne setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    answerOne.backgroundColor = [UIColor whiteColor];
    answerOne.layer.borderColor = [UIColor greenColor].CGColor;
    answerOne.layer.borderWidth = 2.0f;
    answerOne.layer.cornerRadius = 10.0f;
    
    UIButton *answerTwo = (UIButton*)[_answerButtons objectAtIndex:1];
    [answerTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    //[answerTwo setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    answerTwo.backgroundColor = [UIColor whiteColor];
    answerTwo.layer.borderColor = [UIColor grayColor].CGColor;
    answerTwo.layer.borderWidth = 2.0f;
    answerTwo.layer.cornerRadius = 10.0f;
    
    UIButton *answerThree = (UIButton*)[_answerButtons objectAtIndex:2];
    [answerThree setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
    //[answerThree setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    answerThree.backgroundColor = [UIColor whiteColor];
    answerThree.layer.borderColor = [UIColor yellowColor].CGColor;
    answerThree.layer.borderWidth = 2.0f;
    answerThree.layer.cornerRadius = 10.0f;
    
    UIButton *answerFour = (UIButton*)[_answerButtons objectAtIndex:3];
    [answerFour setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //[answerFour setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    answerFour.backgroundColor = [UIColor whiteColor];
    answerFour.layer.borderColor = [UIColor blueColor].CGColor;
    answerFour.layer.borderWidth = 2.0f;
    answerFour.layer.cornerRadius = 10.0f;
}

-(void)updateView {
    _questionNum.text = [NSString stringWithFormat:@"%i", _quickQuestion.quickQuestion.quickQuestionID];
    
    _questionText.text = _quickQuestion.quickQuestion.question;
}

-(void)setQuickQuestion:(VDCompoundQuickQuestion *)quickQuestion {
    _quickQuestion = quickQuestion;
    [self updateView];
}

-(IBAction)dismissKeyboard:(id)sender {
    [self.questionText resignFirstResponder];
}

-(IBAction)answerPressed:(id)sender {
    UIButton *answerBtn = (UIButton*)sender;
    self.highlightedBtn = answerBtn;
}

-(void)setHighlightedBtn:(UIButton *)highlightedBtn {
    _highlightedBtn.highlighted = NO;
    [_highlightedBtn setBackgroundColor:[UIColor whiteColor]];
    _highlightedBtn = highlightedBtn;
    _highlightedBtn.highlighted = YES;
    [_highlightedBtn setBackgroundColor:[UIColor lightGrayColor]];
}

#pragma mark - UITextFieldDelegate Methods
-(void)textViewDidBeginEditing:(UITextView *)textView {
    VDRootViewController *rootVC = [VDRootViewController getInstance];
    [rootVC slideForInput:textView];
    
    [rootVC.view addGestureRecognizer:self.dismissKeyboardTap];
}
-(void)textViewDidEndEditing:(UITextView *)textView {
    VDRootViewController *rootVC = [VDRootViewController getInstance];
    [rootVC unSlideForInput];
    
    [rootVC.view removeGestureRecognizer:self.dismissKeyboardTap];
}
#pragma mark ---

@end
