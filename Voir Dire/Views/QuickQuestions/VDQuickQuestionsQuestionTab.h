//
//  VDQuickQuestionsQuestionTab.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDQuickQuestionsTabBar.h"
#import "FXLabel.h"

@interface VDQuickQuestionsQuestionTab : UIView

@property (nonatomic, weak) IBOutlet FXLabel *questionLabel;
@property (nonatomic, weak) VDQuickQuestionsTabBar *tabBar;

@property (nonatomic) BOOL selected;

@end
