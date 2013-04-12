//
//  VDJuryPoolViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXReorderableCollectionViewFlowLayout.h"
#import "VDTrialCase.h"

@class VDVoirDireViewController;

@protocol VDJuryPoolViewControllerDelegate <NSObject>

-(void)juryPoolVCDidSelectCell:(UICollectionViewCell*)cell ForIndex:(NSInteger)index InJurors:(NSMutableArray*)jurors;
-(void)juryPoolVCDidDeselectCell:(UICollectionViewCell*)cell ForIndex:(NSInteger)index InJurors:(NSMutableArray*)jurors;

@end


@interface VDJuryPoolViewController : UICollectionViewController <LXReorderableCollectionViewDelegateFlowLayout>

@property (nonatomic, readwrite, weak) VDVoirDireViewController *voirDireVC;
@property (nonatomic, readwrite, strong) NSMutableArray *jurors;
@property (nonatomic, readwrite, weak) id<VDJuryPoolViewControllerDelegate> delegate;

@end
