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

@interface VDQuickQuestionsQuestionViewController ()

@property (nonatomic, readwrite, weak) IBOutlet FXLabel *questionNum;
@property (nonatomic, readwrite, weak) IBOutlet FXLabel *questionText;

-(void)updateView;

@end

@implementation VDQuickQuestionsQuestionViewController

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
	// Do any additional setup after loading the view.;
    
    [self updateView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

-(void)updateView {
    _questionNum.text = [NSString stringWithFormat:@"%i", _quickQuestion.quickQuestion.quickQuestionID];
    
    CGSize questionTextSize = [_quickQuestion.quickQuestion.question sizeWithFont:_questionText.font forWidth:_questionText.frame.size.width lineBreakMode:NSLineBreakByWordWrapping];
    _questionText.text = _quickQuestion.quickQuestion.question;
    _questionText.frame = CGRectMake(_questionText.frame.origin.x, _questionText.frame.origin.y, _questionText.frame.size.width, questionTextSize.height);
    
    NSLog(@"Question Text Frame: %@", NSStringFromCGRect(_questionText.frame));
    NSLog(@"Question Text Parent Frame: %@", NSStringFromCGRect([_questionText superview].frame));
}

-(void)setQuickQuestion:(VDCompoundQuickQuestion *)quickQuestion {
    _quickQuestion = quickQuestion;
    [self updateView];
}

@end
