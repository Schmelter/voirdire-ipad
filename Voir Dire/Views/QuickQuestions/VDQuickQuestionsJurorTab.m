//
//  VDQuickQuestionsJurorTab.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsJurorTab.h"
#import "FXLabel.h"

@interface VDQuickQuestionsJurorTab ()

@property (nonatomic, weak) IBOutlet UIButton *jurorButton;
@property (nonatomic, weak) IBOutlet FXLabel *jurorLabel;

-(IBAction)jurorPressed:(id)sender;

@end

@implementation VDQuickQuestionsJurorTab

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.selected = NO;
    }
    return self;
}

-(IBAction)jurorPressed:(id)sender {
    [_tabBar selectJurorTab:self];
}

-(void)setSelected:(BOOL)selected {
    _selected = selected;
}

@end
