//
//  VDLoginViewController.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/19/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDLoginViewController.h"

@interface VDLoginViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UITextField *username;
@property (nonatomic, readwrite, weak) IBOutlet UITextField *password;
@property (nonatomic, readwrite, strong) IBOutletCollection(UITextField) NSArray *textFields;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *backgroundTapGestureRecognizer;

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

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (gestureRecognizer == _backgroundTapGestureRecognizer) {
        
        // Allow background tap only if a text field is currently first responder
        for (UITextField *textField in _textFields) {
            
            if (textField.isFirstResponder)
                return YES;
        }
    }
    
    return NO;
}

@end
