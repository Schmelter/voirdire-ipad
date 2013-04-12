//
//  VDQuickQuestionsQuestionViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDCompoundQuickQuestion.h"

@interface VDQuickQuestionsQuestionViewController : VDViewController

@property (nonatomic, readwrite, strong) VDCompoundQuickQuestion *quickQuestion;

@end
