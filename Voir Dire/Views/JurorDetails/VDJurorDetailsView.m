//
//  VDJurorDetailsView.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorDetailsView.h"
#import <QuartzCore/QuartzCore.h>

@interface VDJurorDetailsView ()

-(IBAction)xPushed:(id)sender;
-(IBAction)notesLeftPressed:(id)sender;
-(IBAction)notesRightPressed:(id)sender;

@end

@implementation VDJurorDetailsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = 15;
    self.layer.masksToBounds = YES;
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 2.0f;
    
    [super drawRect:rect];
}

-(IBAction)xPushed:(id)sender {
    [self.delegate jurorDetailsWillClose:self];
    [self removeFromSuperview];
}

-(IBAction)notesLeftPressed:(id)sender {
    [self.delegate notesLeftPressed:self];
}

-(IBAction)notesRightPressed:(id)sender {
    [self.delegate notesRightPressed:self];
}

@end
