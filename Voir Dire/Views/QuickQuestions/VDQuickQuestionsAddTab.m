//
//  VDQuickQuestionsAddTab.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsAddTab.h"

@interface VDQuickQuestionsAddTab ()

@property (nonatomic, weak) IBOutlet UIButton *addButton;

-(IBAction)addPressed:(id)sender;

@end


@implementation VDQuickQuestionsAddTab

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)addPressed:(id)sender {
    [_tabBar addQuestionPressed];
}

@end
