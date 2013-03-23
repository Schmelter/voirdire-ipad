//
//  VDCaseListCell.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDTrialCase.h"

@interface VDCaseListCell : UITableViewCell

@property (nonatomic, readwrite, strong) VDTrialCase *trialCase;

@end
