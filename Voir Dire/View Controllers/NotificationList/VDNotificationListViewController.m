//
//  VDNotificationListViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDNotificationListViewController.h"
#import "VDNotificationManager.h"
#import "VDCurrentLawFirmUserManager.h"
#import "VDNotificationCell.h"

@interface VDNotificationListViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UITableView *tableView;
@property (nonatomic, readwrite, weak) IBOutlet NSArray *notifications;

@end

@implementation VDNotificationListViewController

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
    
    [VDCurrentLawFirmUserManager currentUserWithSuccessHandler:^(VDLawFirmUser *user){
        [VDNotificationManager pendingNotificationsForUser:user WithSuccessHandler:^(NSArray *notifications) {
            self.notifications = notifications;
            [self.tableView reloadData];
        } withFailure:^(NSError *error){
            
        }];
    } withFailure:^(NSError *error){
        
    }];
}

#pragma mark - UITableViewDelegate UITableViewDataSource methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.notifications count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* CellIdentifier = @"VDNotificationCell";
    
    VDNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.notification = [self.notifications objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    VDNotification *notification = [_notifications objectAtIndex:indexPath.row];
    notification.hasBeenRead = !notification.hasBeenRead;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
#pragma mark ---

@end
