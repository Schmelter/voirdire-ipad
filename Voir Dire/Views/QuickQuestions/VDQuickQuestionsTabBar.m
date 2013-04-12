    //
//  VDQuickQuestionsTabBar.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsTabBar.h"
#import "VDQuickQuestionsJurorTab.h"
#import "VDQuickQuestionsAddTab.h"
#import "VDJuror.h"

#define kJurorTabSpacing 5.0

@interface VDQuickQuestionsTabBar ()

-(void)updateView;

@end


@implementation VDQuickQuestionsTabBar

@synthesize jurorTabs = _jurorTabs;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.jurorTabs = [[NSMutableArray alloc] initWithCapacity:10];
    }
    return self;
}

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
    if (self && [[self subviews] count] == 0) {
        VDQuickQuestionsTabBar* real = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsTabBar" owner:nil options:nil] objectAtIndex:0];
        
        // Transfer over the interface builder properties.
        NSArray *interfaceBuilderKeys = @[ @"alpha", @"autoresizesSubviews", @"autoresizingMask", @"frame", @"hidden", @"translatesAutoresizingMaskIntoConstraints" ];
        [real setValuesForKeysWithDictionary:[self dictionaryWithValuesForKeys:interfaceBuilderKeys]];
        
        
        // Transfer custom properties
        NSArray *customKeys = @[ @"delegate" ];
        [real setValuesForKeysWithDictionary:[self dictionaryWithValuesForKeys:customKeys]];
        
        real.jurorTabs = [[NSMutableArray alloc] initWithCapacity:10];
        
        [real updateView];
        return real;
    }
    return self;
}

-(void)updateView {
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        [subView removeFromSuperview];
    }];
    
    __block float xIndent = 0;
    [_jurorTabs enumerateObjectsUsingBlock:^(VDQuickQuestionsJurorTab *tab, NSUInteger idx, BOOL *stop) {
        tab.tabBar = self;
        [self addSubview:tab];
        tab.frame = CGRectMake(xIndent, 0, tab.frame.size.width, tab.frame.size.height);
        xIndent += tab.frame.size.width + kJurorTabSpacing;
    }];
    
    // Add the add tab bar view
    VDQuickQuestionsAddTab *addTab = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsAddTab" owner:nil options:nil] objectAtIndex:0];
    addTab.tabBar = self;
    [self addSubview:addTab];
    addTab.frame = CGRectMake(xIndent, 0, addTab.frame.size.width, addTab.frame.size.height);
    
    [self setNeedsDisplay];
}

-(void)setJurorTabs:(NSMutableArray *)jurorTabs {
    _jurorTabs = jurorTabs;
    [self updateView];
}

-(void)addJurorPressed {
    [self.delegate addJurorPressedForTabBar:self];
}

-(void)jurorPressed:(VDQuickQuestionsJurorTab*)jurorTab {
    self.selectedTab = jurorTab;
}

-(void)setSelectedTab:(VDQuickQuestionsJurorTab *)selectedTab {
    _selectedTab.selected = NO;
    _selectedTab = selectedTab;
    _selectedTab.selected = YES;
    [self.delegate tabBar:self didSelectTab:_selectedTab];
}

-(void)addJurorTab:(VDQuickQuestionsJurorTab *)jurorTab {
    [_jurorTabs addObject:jurorTab];
    [self updateView];
}

@end
