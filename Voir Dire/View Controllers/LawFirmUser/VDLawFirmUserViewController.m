//
//  VDLawFirmUserViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDLawFirmUserViewController.h"
#import "VDLawFirmUser.h"
#import "VDCurrentLawFirmUserManager.h"

@interface VDLawFirmUserViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UILabel *login;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *first;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *last;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *firm;

@end

@implementation VDLawFirmUserViewController

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
    
    [VDCurrentLawFirmUserManager currentUserWithSuccessHandler:^(VDLawFirmUser *currentUser){
        _login.text = currentUser.login;
        _first.text = currentUser.nameFirst;
        _last.text = currentUser.nameLast;
        _firm.text = @"Law Firm";
    } withFailure:^(NSError *error){
        
    }];
}

@end
