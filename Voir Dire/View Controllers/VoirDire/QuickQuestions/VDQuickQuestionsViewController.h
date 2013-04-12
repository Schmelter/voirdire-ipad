//
//  VDQuickQuestionsViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/9/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"
#import "VDQuickQuestionsTabBar.h"
#import "VDVoirDireViewController.h"

@interface VDQuickQuestionsViewController : VDViewController <VDQuickQuestionsTabBarDelegate>

@property (nonatomic, weak) VDVoirDireViewController *voirDireVC;
@property (nonatomic, strong) NSMutableArray *quickQuestions;

@end
