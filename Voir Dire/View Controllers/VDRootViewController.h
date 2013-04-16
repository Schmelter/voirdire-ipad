//
//  VDRootViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDViewController.h"

@interface VDRootViewController : UIViewController

-(void)presentLoginViewController;
-(void)dismissLoginViewController;

#pragma mark - Slide the view around whenever a keyboard is displayed
/** Slide the view up when some input is displayed that overlaps an element being typed into. */
-(void)setSlideForInput:(id)sender portraitAmount:(NSNumber*)portraitAmount landscapeAmount:(NSNumber*)landscapeAmount;
/** Slide for input based on the sender. */
-(void)slideForInput:(id)sender;
/** Unslide for Input. */
-(void)unSlideForInput;
#pragma mark ---

+(VDRootViewController*)getInstance;

@end
