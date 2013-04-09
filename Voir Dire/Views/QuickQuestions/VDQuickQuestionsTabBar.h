//
//  VDQuickQuestionsTabBar.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VDQuickQuestionsJurorTab;
@class VDQuickQuestionsTabBar;

@protocol VDQuickQuestionsTabBarDelegate <NSObject>

@required
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar didSelectTab:(VDQuickQuestionsJurorTab*)selectedTab;
-(void)addJurorPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar;

@end



@interface VDQuickQuestionsTabBar : UIView

@property (nonatomic, weak) IBOutlet id<VDQuickQuestionsTabBarDelegate> delegate;
@property (nonatomic, strong) NSArray *jurorTabs;
@property (nonatomic, strong) VDQuickQuestionsJurorTab *selectedTab;

-(void)addJurorPressed;
-(void)jurorPressed:(VDQuickQuestionsJurorTab*)jurorTab;

@end
