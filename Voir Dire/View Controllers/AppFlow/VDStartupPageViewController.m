//
//  VDStartupPageViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDStartupPageViewController.h"

@interface VDStartupPageViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UINavigationController *navigationController;

@end

@implementation VDStartupPageViewController

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
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([@"EmbedUINavigationControllerSegue" isEqualToString:segue.identifier]) {
        self.navigationController = segue.destinationViewController;
    }
}

@end
