//
//  VDLogoutHandleButton.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/2/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDLogoutHandleButton.h"

@interface VDLogoutHandleButton ()

- (void)notifyDidPress;

@end

@implementation VDLogoutHandleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(notifyDidPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self addTarget:self action:@selector(notifyDidPress) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)notifyDidPress
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kVDNotificationLogoutPressed object:self];
}

@end
