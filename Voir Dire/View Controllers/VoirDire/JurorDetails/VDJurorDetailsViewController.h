//
//  VDJurorDetailsViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VDJuror.h"

@class VDJurorDetailsViewController;

@protocol VDJurorDetailsViewControllerDelegate <NSObject>

@required
-(void)jurorDetailsWillClose:(VDJurorDetailsViewController*)jurorDetailsVC;

@end



@interface VDJurorDetailsViewController : UIViewController

@property (nonatomic, readwrite, strong) NSMutableArray *jurors;
@property (nonatomic, readwrite) NSInteger jurorIdx;
@property (nonatomic, readwrite, weak) id<VDJurorDetailsViewControllerDelegate> delegate;

@end
