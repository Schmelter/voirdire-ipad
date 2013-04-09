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
-(NSInteger)jurorCountForTabBar:(VDQuickQuestionsTabBar*)tabBar;
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar jurorTabAdded:(VDQuickQuestionsJurorTab*)jurorTab;
-(void)tabBar:(VDQuickQuestionsTabBar*)tabBar jurorSelected:(VDQuickQuestionsJurorTab*)jurorTab;

@end



@interface VDQuickQuestionsTabBar : UIView

@property (nonatomic, weak) id<VDQuickQuestionsTabBarDelegate> delegate;

-(void)addJurorPressed;
-(void)selectJurorTab:(VDQuickQuestionsJurorTab*)jurorTab;
-(void)removeJurorTab:(VDQuickQuestionsJurorTab*)jurorTab;

@end
