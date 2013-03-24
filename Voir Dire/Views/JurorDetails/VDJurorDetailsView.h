//
//  VDJurorDetailsView.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VDJurorDetailsView;

@protocol VDJurorDetailsDelegate <NSObject>

@optional
-(void)jurorDetailsWillClose:(VDJurorDetailsView*)jurorDetails;
-(void)notesLeftPressed:(VDJurorDetailsView*)jurorDetails;
-(void)notesRightPressed:(VDJurorDetailsView*)jurorDetails;

@end



@interface VDJurorDetailsView : UIView

@property (nonatomic, readwrite, weak) IBOutlet UILabel *number;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *firstName;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *lastName;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *gender;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *maritalStatus;
@property (nonatomic, readwrite, weak) IBOutlet UIView *avatar;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *starRating;
@property (nonatomic, readwrite, weak) IBOutlet UIView *pipOne;
@property (nonatomic, readwrite, weak) IBOutlet UIView *pipTwo;
@property (nonatomic, readwrite, weak) IBOutlet UIView *pipThree;
@property (nonatomic, readwrite, weak) IBOutlet UIView *pipFour;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *notes;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *noteCount;
@property (nonatomic, readwrite, weak) IBOutlet UIScrollView *notesScrollView;

@property (nonatomic, readwrite, weak) id<VDJurorDetailsDelegate> delegate;

@end
