//
//  VDJuryPoolViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXReorderableCollectionViewFlowLayout.h"
#import "VDVoirDireViewController.h"
#import "VDTrialCase.h"

@interface VDJuryPoolViewController : UICollectionViewController <LXReorderableCollectionViewDelegateFlowLayout>

@property (nonatomic, readwrite, weak) VDVoirDireViewController *voirDireVC;
@property (nonatomic, readwrite, strong) NSMutableArray *jurors;

@end
