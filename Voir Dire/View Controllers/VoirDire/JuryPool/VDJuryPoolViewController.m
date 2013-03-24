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

@interface VDJuryPoolViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, readwrite, strong) NSMutableArray *jurors;

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
    [VDJurorManager jurorsForTrialCase:self.trialCase withSuccessHandler:^(NSMutableArray *jurors){
        self.jurors = jurors;
        [self.collectionView reloadData];
    } withFailure:^(NSError *error){
        
    }];
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
    
    if (juror.race == VDRace_White) {
        cell.avatar.backgroundColor = [UIColor lightGrayColor];
    } else if (juror.race == VDRace_Black) {
        cell.avatar.backgroundColor = [UIColor grayColor];
    } else if (juror.race == VDRace_AmericanIndian) {
        cell.avatar.backgroundColor = [UIColor redColor];
    } else if (juror.race == VDRace_Asian) {
        cell.avatar.backgroundColor = [UIColor yellowColor];
    } else if (juror.race == VDRace_PacificIslander) {
        cell.avatar.backgroundColor = [UIColor blueColor];
    } else if (juror.race == VDRace_HispanicLatino) {
        cell.avatar.backgroundColor = [UIColor brownColor];
    } else if (juror.race == VDRace_Other) {
        cell.avatar.backgroundColor = [UIColor orangeColor];
    }
    
    if (juror.gender == VDGender_Male) {
        cell.gender.text = @"Male";
    } else if (juror.gender == VDGender_Female) {
        cell.gender.text = @"Female";
    } else {
        cell.gender.text = @"Other";
    }
    
    NSMutableString *ratingStr = [[NSMutableString alloc] initWithCapacity:5];
    for (NSInteger i = 0; i < juror.rating; i++) {
        [ratingStr appendString:@"★"];
    }
    cell.starRating.text = ratingStr;
    
    cell.pipOne.backgroundColor = [UIColor redColor];
    cell.pipTwo.backgroundColor = [UIColor blueColor];
    cell.pipThree.backgroundColor = [UIColor yellowColor];
    cell.pipFour.backgroundColor = [UIColor orangeColor];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    VDJurorViewCell *viewCell = (VDJurorViewCell*) [collectionView cellForItemAtIndexPath:indexPath];
    VDJuror *juror = [self.jurors objectAtIndex:indexPath.row];
    [self.voirDireVC displayJurorDetails:juror];
}
#pragma mark ---


@end
