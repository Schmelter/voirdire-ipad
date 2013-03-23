//
//  VDCaseListCell.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDCaseListCell.h"
#import <QuartzCore/QuartzCore.h>

@interface VDCaseListCell ()

@property (nonatomic, readwrite, weak) IBOutlet UILabel *title;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *plaintiffVDefendant;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *complaintDate;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *trialCounty;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *numberOfNotes;

@end

@implementation VDCaseListCell

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

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocale:usLocale];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    });
    
    _title.text = [NSString stringWithFormat:@"%@/%@: %@", _trialCase.docketNumber, _trialCase.caseNumber, _trialCase.caseName];
    _plaintiffVDefendant.text = [NSString stringWithFormat:@"%@ vs. %@", _trialCase.plaintiffNames, _trialCase.defendantNames];
    _complaintDate.text = [dateFormatter stringFromDate:_trialCase.complaintDate];
    _trialCounty.text = _trialCase.trialCounty;
    _numberOfNotes.text = [NSString stringWithFormat:@"Notes: %i", [[_trialCase trialCaseNotes] count]];
    
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    [super drawRect:rect];
}

@end
