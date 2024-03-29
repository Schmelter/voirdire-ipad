//
//  VDJurorViewCell.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VDJurorViewCell : UICollectionViewCell

@property (nonatomic, readwrite, weak) IBOutlet UILabel *number;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *avatar;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *starRating;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipOne;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipTwo;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipThree;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipFour;

@end
