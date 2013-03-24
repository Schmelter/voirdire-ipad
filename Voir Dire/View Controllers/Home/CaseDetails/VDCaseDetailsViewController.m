//
//  VDCaseDetailsViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/23/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDCaseDetailsViewController.h"

@interface VDCaseDetailsViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UILabel *caseNumber;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *docketNumber;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *caseName;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *trialCounty;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *trialJudge;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *plaintiff;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *defendant;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *complaintDt;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *juryDt;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *openingDt;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *closingDt;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *verdictDt;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *notes;

-(void)updateView;

@end

@implementation VDCaseDetailsViewController

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

-(void)viewWillAppear:(BOOL)animated {
    [self updateView];
    [super viewWillAppear:animated];
}

-(void)updateView {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setLocale:usLocale];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    });
    
    self.caseNumber.text = self.trialCase.caseNumber;
    self.docketNumber.text = self.trialCase.docketNumber;
    self.caseName.text = self.trialCase.caseName;
    self.trialCounty.text = self.trialCase.trialCounty;
    self.trialJudge.text = self.trialCase.trialJudge;
    self.plaintiff.text = self.trialCase.plaintiffNames;
    self.defendant.text = self.trialCase.defendantNames;
    self.complaintDt.text = [dateFormatter stringFromDate:self.trialCase.complaintDate];
    self.juryDt.text = [dateFormatter stringFromDate:self.trialCase.jurySelectionDate];
    self.openingDt.text = [dateFormatter stringFromDate:self.trialCase.openingArgumentDate];
    self.closingDt.text = [dateFormatter stringFromDate:self.trialCase.closingArgumentDate];
    self.verdictDt.text = [dateFormatter stringFromDate:self.trialCase.verdictDate];
    self.notes.text = [NSString stringWithFormat:@"%i", [self.trialCase.trialCaseNotes count]];
}

-(void)setTrialCase:(VDTrialCase *)trialCase {
    _trialCase = trialCase;
    [self updateView];
}

@end
