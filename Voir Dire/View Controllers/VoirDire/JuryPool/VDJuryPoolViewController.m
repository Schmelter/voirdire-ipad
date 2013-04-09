//
//  VDJuryPoolViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJuryPoolViewController.h"
#import "VDJuror.h"
#import "VDJurorManager.h"
#import "VDJurorViewCell.h"
#import <stdlib.h>
#import "VDJurorToAvatar.h"

@interface VDJuryPoolViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UICollectionView *collectionView;

@end

@implementation VDJuryPoolViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.collectionView reloadData];
}

#pragma mark - LXReorderableCollectionViewDelegateFlowLayout Methods
- (void)collectionView:(UICollectionView *)theCollectionView layout:(UICollectionViewLayout *)theLayout itemAtIndexPath:(NSIndexPath *)theFromIndexPath willMoveToIndexPath:(NSIndexPath *)theToIndexPath {
    id fromJuror = [self.jurors objectAtIndex:theFromIndexPath.item];
    [self.jurors removeObjectAtIndex:theFromIndexPath.item];
    [self.jurors insertObject:fromJuror atIndex:theToIndexPath.item];
}
#pragma mark ---

#pragma mark - UICollectionViewDataSource and UICollectionViewDelegate methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.jurors count];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //static NSString* CellIdentifier = @"VDJurorViewCell";
    VDJuror *juror = [self.jurors objectAtIndex:indexPath.row];
    
    VDJurorViewCell *cell = nil; //[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil ) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"VDJurorViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.number.text = juror.jurorNumber;
    
    UIImage *avatarImage = [VDJurorToAvatar jurorToAvatar:juror];
    cell.avatar.image = avatarImage;
    
    NSMutableString *ratingStr = [[NSMutableString alloc] initWithCapacity:5];
    for (NSInteger i = 0; i < juror.rating; i++) {
        [ratingStr appendString:@"★"];
    }
    cell.starRating.text = ratingStr;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    cell.highlighted = YES;
    
    [self.voirDireVC displayJurorDetails:indexPath.row ForJurors:self.jurors];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    cell.highlighted = NO;
}
#pragma mark ---

-(void)setJurors:(NSMutableArray *)jurors {
    _jurors = jurors;
    [self.collectionView reloadData];
}

@end
