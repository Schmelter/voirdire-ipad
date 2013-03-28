//
//  VDJurorDetailsViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "VDJurorNote.h"
#import "VDJurorToAvatar.h"
#import "VDConstants.h"

@interface VDJurorDetailsViewController ()

@property (nonatomic, readwrite, weak) IBOutlet UILabel *number;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *firstName;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *lastName;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *gender;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *maritalStatus;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *avatar;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *starRating;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipOne;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipTwo;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipThree;
@property (nonatomic, readwrite, weak) IBOutlet UIImageView *pipFour;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *notes;
@property (nonatomic, readwrite, weak) IBOutlet UILabel *noteCount;
@property (nonatomic, readwrite, weak) IBOutlet UIScrollView *notesScrollView;
@property (nonatomic, readwrite, weak) IBOutlet UIView *notesScrollContentView;
@property (nonatomic, readwrite) NSInteger currentNote;

-(IBAction)xPushed:(id)sender;
-(IBAction)notesLeftPressed:(id)sender;
-(IBAction)notesRightPressed:(id)sender;
-(void)updateJurorDetails;
-(IBAction)jurorLeftPressed:(id)sender;
-(IBAction)jurorRightPressed:(id)sender;

@end

@implementation VDJurorDetailsViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.currentNote = -1;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.currentNote = -1;
    }
    return self;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateJurorDetails];
}

-(void)viewWillAppear:(BOOL)animated {
    self.view.layer.cornerRadius = 15;
    self.view.layer.masksToBounds = YES;
    
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.layer.borderWidth = 2.0f;
    
    _notesScrollView.layer.borderColor = VD_GRADIENT_COLOR_GRAY.CGColor;
    _notesScrollView.layer.borderWidth = 1.5f;
    _notesScrollView.layer.cornerRadius = 10;
    _notesScrollView.layer.masksToBounds = YES;
    
    [super viewWillAppear:animated];
}

-(IBAction)xPushed:(id)sender {
    [self.delegate jurorDetailsWillClose:self];
}

-(void)updateJurorDetails {
    VDJuror *juror = [self.jurors objectAtIndex:_jurorIdx];
    self.number.text = juror.jurorNumber;
    self.firstName.text = juror.nameFirst;
    self.lastName.text = juror.nameLast;
    
    UIImage *avatarImage = [VDJurorToAvatar jurorToAvatar:juror];
    self.avatar.image = avatarImage;
    
    if (juror.gender == VDGender_Male) {
        self.gender.text = @"Male";
    } else if (juror.gender == VDGender_Female) {
        self.gender.text = @"Female";
    } else {
        self.gender.text = @"Other";
    }
    
    if (juror.maritalStatus == VDMaritalStatus_Divorced) {
        self.maritalStatus.text = @"Divorced";
    } else if (juror.maritalStatus == VDMaritalStatus_Married) {
        self.maritalStatus.text = @"Married";
    } else if (juror.maritalStatus == VDMaritalStatus_Other) {
        self.maritalStatus.text = @"Other";
    } else if (juror.maritalStatus == VDMaritalStatus_Single) {
        self.maritalStatus.text = @"Single";
    } else if (juror.maritalStatus == VDMaritalStatus_Widowed) {
        self.maritalStatus.text = @"Widowed";
    }
    
    NSMutableString *ratingStr = [[NSMutableString alloc] initWithCapacity:13];
    [ratingStr appendString:@"Rating: "];
    for (NSInteger i = 0; i < juror.rating; i++) {
        [ratingStr appendString:@"★"];
    }
    self.starRating.text = ratingStr;
    
    
    self.noteCount.text = [NSString stringWithFormat:@"%i / %i", self.currentNote, [juror.jurorNotes count]];
    if ([juror.jurorNotes count] > 0) {
        NSString *note = [[juror.jurorNotes objectAtIndex:(self.currentNote-1)] notes];
        self.notes.text = note;
        CGSize noteSize = [note sizeWithFont:self.notes.font forWidth:(self.notesScrollView.frame.size.width - 10) lineBreakMode:NSLineBreakByWordWrapping];
        self.notes.frame = CGRectMake(5, 5, noteSize.width, noteSize.height);
        self.notesScrollContentView.frame = CGRectMake(0, 0, self.notes.frame.size.width+10, self.notes.frame.size.height+10);
        self.notesScrollView.contentSize = self.notesScrollContentView.frame.size;
    }
}

-(IBAction)notesLeftPressed:(id)sender {
    if (self.currentNote - 1 > 0) {
        self.currentNote -= 1;
        [self updateJurorDetails];
    }
}

-(IBAction)notesRightPressed:(id)sender {
    VDJuror *juror = [self.jurors objectAtIndex:_jurorIdx];
    if (self.currentNote < [juror.jurorNotes count]) {
        self.currentNote += 1;
        [self updateJurorDetails];
    }
}

-(void)setJurors:(NSMutableArray *)jurors {
    _jurors = jurors;
    _jurorIdx = 0;
    _currentNote = 1;
    [self updateJurorDetails];
}

-(void)setJurorIdx:(NSInteger)jurorIdx {
    _jurorIdx = jurorIdx;
    _currentNote = 1;
    [self updateJurorDetails];
}

-(IBAction)jurorLeftPressed:(id)sender {
    if (self.jurorIdx - 1 > 0) {
        self.jurorIdx--;
    }
}

-(IBAction)jurorRightPressed:(id)sender {
    if (self.jurorIdx + 1 < [self.jurors count]) {
        self.jurorIdx++;
    }
}

@end
