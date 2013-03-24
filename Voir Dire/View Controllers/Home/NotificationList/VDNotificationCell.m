//
//  VDNotificationCell.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDNotificationCell.h"
#import <QuartzCore/QuartzCore.h>

@interface VDNotificationCell ()

@property (nonatomic, readwrite, weak) IBOutlet UILabel *notificationDate;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *notificationText;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *hasBeenReadImage;

-(void)updateView;

@end

@implementation VDNotificationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)drawRect:(CGRect)rect {
    [self updateView];
    [super drawRect:rect];
}

-(void)updateView {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocale:usLocale];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    });
    
    self.notificationDate.text = [NSString stringWithFormat:@"Notification Date: %@", [dateFormatter stringFromDate:self.notification.date]];
    self.notificationText.text = self.notification.notification;
    if (self.notification.hasBeenRead) {
        self.hasBeenReadImage.image = [UIImage imageNamed:@"radio_selected"];
    } else {
        self.hasBeenReadImage.image = nil;
    }
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
}

-(void)setNotification:(VDNotification *)notification {
    _notification = notification;
    [_notification addObserver:self forKeyPath:@"hasBeenRead" options:NSKeyValueObservingOptionNew context:nil];
    [self updateView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self updateView];
}

@end
