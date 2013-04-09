//
//  VDQuickQuestionsTabBar.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDQuickQuestionsTabBar.h"
#import "VDQuickQuestionsJurorTab.h"
#import "VDJuror.h"

#define kJurorTabWidth 50
#define kJurorTabHeight 50

@interface VDQuickQuestionsTabBar ()

@property (nonatomic, strong) NSMutableArray *jurorTabs;
@property (nonatomic, weak) VDQuickQuestionsJurorTab *selectedTab;

-(void)updateView;

@end


@implementation VDQuickQuestionsTabBar

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
        NSArray *customKeys = @[ @"buttonAlpha", @"decimalHidden", @"delegate" ];
        [real setValuesForKeysWithDictionary:[self dictionaryWithValuesForKeys:customKeys]];
        
        return real;
    }
    return self;
}

-(void)updateView {
    
    
    [self setNeedsDisplay];
}

-(void)addJurorPressed {
    VDQuickQuestionsJurorTab *newTab = [[[NSBundle mainBundle] loadNibNamed:@"VDQuickQuestionsJurorTab" owner:self options:nil] objectAtIndex:0];
    [_jurorTabs addObject:newTab];
    [self updateView];
    self.selectedTab = newTab;
    [self.delegate tabBar:self jurorTabAdded:newTab];
}

-(void)jurorPressed:(VDQuickQuestionsJurorTab*)jurorTab {
    self.selectedTab = jurorTab;
    
}

-(void)setSelectedTab:(VDQuickQuestionsJurorTab *)selectedTab {
    _selectedTab.selected = NO;
    _selectedTab = selectedTab;
    _selectedTab.selected = YES;
}

@end
