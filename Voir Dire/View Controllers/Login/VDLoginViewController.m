//
//  VDLoginViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDLoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VDLoginViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UITextField *username;
@property (nonatomic, readwrite, weak) IBOutlet UITextField *password;
@property (nonatomic, readwrite, strong) IBOutletCollection(UITextField) NSArray *textFields;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *backgroundTapGestureRecognizer;
@property (nonatomic, readwrite, weak) IBOutlet UIView *contentView;

-(IBAction)usernameReturn:(id)sender;
-(IBAction)passwordReturn:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)newUserPushed:(id)sender;

@end

@implementation VDLoginViewController

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

- (void)viewWillAppear:(BOOL)animated {
    _contentView.layer.cornerRadius = 15;
    _contentView.layer.masksToBounds = YES;
    
    [super viewWillAppear:animated];
}

-(IBAction)usernameReturn:(id)sender {
    [_password becomeFirstResponder];
}

-(IBAction)passwordReturn:(id)sender {
    [_password resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender {
    [_textFields enumerateObjectsUsingBlock:^(UITextField* textField, NSUInteger idx, BOOL *stop){
        [textField resignFirstResponder];
    }];
}

-(IBAction)newUserPushed:(id)sender {
    
}

#pragma mark ---

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_username == textField) {
        [_password becomeFirstResponder];
    } else if (_password == textField) {
        [_password resignFirstResponder];
    }
    return YES;
}

#pragma mark ---
@end
