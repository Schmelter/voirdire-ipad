//
//  VDQuickQuestionsTabBar.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VDQuickQuestionsQuestionTab;
@class VDQuickQuestionsTabBar;

@protocol VDQuickQuestionsTabBarDelegate <NSObject>

@required
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar didSelectTab:(VDQuickQuestionsQuestionTab*)selectedTab;
-(void)addQuestionPressedForTabBar:(VDQuickQuestionsTabBar*)tabBar;

@end



@interface VDQuickQuestionsTabBar : UIView {
    @private
    NSMutableArray *_questionTabs;
}

@property (nonatomic, weak) IBOutlet id<VDQuickQuestionsTabBarDelegate> delegate;
@property (nonatomic, readonly, strong) NSArray *questionTabs;
@property (nonatomic, strong) VDQuickQuestionsQuestionTab *selectedTab;

-(void)addQuestionPressed;
-(void)questionPressed:(VDQuickQuestionsQuestionTab*)questionTab;
-(void)addQuestionTab:(VDQuickQuestionsQuestionTab*)questionTab;

@end
