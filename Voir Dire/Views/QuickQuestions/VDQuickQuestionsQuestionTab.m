//
//  VDQuickQuestionsQuestionTab.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsQuestionTab.h"
#import "FXLabel.h"
#import <QuartzCore/QuartzCore.h>
#import "VDConstants.h"

@interface VDQuickQuestionsQuestionTab ()

@property (nonatomic, weak) IBOutlet UIButton *questionButton;

-(IBAction)questionPressed:(id)sender;

@end

@implementation VDQuickQuestionsQuestionTab

-(void)commonInit {
    self.selected = NO;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = VD_GRADIENT_COLOR_GRAY.CGColor;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self commonInit];
    }
    return self;
}

-(IBAction)questionPressed:(id)sender {
    [_tabBar questionPressed:self];
}

-(void)setSelected:(BOOL)selected {
    _selected = selected;
    if (_selected) {
        self.backgroundColor = VD_GRADIENT_COLOR_GRAY_LIGHT;
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

@end
