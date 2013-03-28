//
//  VDJurorViewCell.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "VDConstants.h"

@interface VDJurorViewCell ()

@end

@implementation VDJurorViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect {
    self.layer.borderColor = VD_GRADIENT_COLOR_GRAY_LIGHT.CGColor;
    self.layer.borderWidth = 1.5f;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    [super drawRect:rect];
}

@end
