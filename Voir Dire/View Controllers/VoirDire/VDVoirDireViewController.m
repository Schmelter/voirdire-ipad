//
//  VDVoirDireViewController.m
//  Voir Dire
//
//  Created by Greg Schmelter on 3/24/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDVoirDireViewController.h"
#import "VDJuryPoolViewController.h"
#import "VDJurorNote.h"

@interface VDVoirDireViewController ()

@property (nonatomic, readwrite, weak) IBOutlet VDJuryPoolViewController *juryPoolVC;
@property (nonatomic, readwrite) NSInteger currentNote;
@property (nonatomic, readwrite, weak) VDJuror *juror;

-(void)updateJurorDetails:(VDJurorDetailsView*)detailsView;

@end

@implementation VDVoirDireViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.currentNote = -1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EmbedVDJuryPoolViewControllerSegue"]) {
        self.juryPoolVC = segue.destinationViewController;
        self.juryPoolVC.trialCase = self.trialCase;
        self.juryPoolVC.voirDireVC = self;
    }
}

-(void)displayJurorDetails:(VDJuror*)juror {
    VDJurorDetailsView *detailsView = [[[NSBundle mainBundle] loadNibNamed:@"VDJurorDetailsView" owner:self options:nil] objectAtIndex:0];
    detailsView.delegate = self;
    [self.view addSubview:detailsView];
    CGRect detailsFrame = detailsView.frame;
    detailsView.frame = CGRectMake((self.view.frame.size.width / 2) - (detailsFrame.size.width/2), (self.view.frame.size.height / 2) - (detailsFrame.size.height / 2), detailsFrame.size.width, detailsFrame.size.height);
    
    self.currentNote = 1;
    self.juror = juror;
    [self updateJurorDetails:detailsView];
}

-(void)updateJurorDetails:(VDJurorDetailsView*)detailsView {
    detailsView.number.text = _juror.jurorNumber;
    detailsView.firstName.text = _juror.nameFirst;
    detailsView.lastName.text = _juror.nameLast;
    
    if (_juror.race == VDRace_White) {
        detailsView.avatar.backgroundColor = [UIColor lightGrayColor];
    } else if (_juror.race == VDRace_Black) {
        detailsView.avatar.backgroundColor = [UIColor grayColor];
    } else if (_juror.race == VDRace_AmericanIndian) {
        detailsView.avatar.backgroundColor = [UIColor redColor];
    } else if (_juror.race == VDRace_Asian) {
        detailsView.avatar.backgroundColor = [UIColor yellowColor];
    } else if (_juror.race == VDRace_PacificIslander) {
        detailsView.avatar.backgroundColor = [UIColor blueColor];
    } else if (_juror.race == VDRace_HispanicLatino) {
        detailsView.avatar.backgroundColor = [UIColor brownColor];
    } else if (_juror.race == VDRace_Other) {
        detailsView.avatar.backgroundColor = [UIColor orangeColor];
    }
    
    if (_juror.gender == VDGender_Male) {
        detailsView.gender.text = @"Male";
    } else if (_juror.gender == VDGender_Female) {
        detailsView.gender.text = @"Female";
    } else {
        detailsView.gender.text = @"Other";
    }
    
    if (_juror.maritalStatus == VDMaritalStatus_Divorced) {
        detailsView.maritalStatus.text = @"Divorced";
    } else if (_juror.maritalStatus == VDMaritalStatus_Married) {
        detailsView.maritalStatus.text = @"Married";
    } else if (_juror.maritalStatus == VDMaritalStatus_Other) {
        detailsView.maritalStatus.text = @"Other";
    } else if (_juror.maritalStatus == VDMaritalStatus_Single) {
        detailsView.maritalStatus.text = @"Single";
    } else if (_juror.maritalStatus == VDMaritalStatus_Widowed) {
        detailsView.maritalStatus.text = @"Widowed";
    }
    
    NSMutableString *ratingStr = [[NSMutableString alloc] initWithCapacity:13];
    [ratingStr appendString:@"Rating: "];
    for (NSInteger i = 0; i < _juror.rating; i++) {
        [ratingStr appendString:@"★"];
    }
    detailsView.starRating.text = ratingStr;
    
    detailsView.pipOne.backgroundColor = [UIColor redColor];
    detailsView.pipTwo.backgroundColor = [UIColor blueColor];
    detailsView.pipThree.backgroundColor = [UIColor yellowColor];
    detailsView.pipFour.backgroundColor = [UIColor orangeColor];
    
    
    detailsView.noteCount.text = [NSString stringWithFormat:@"%i / %i", self.currentNote, [_juror.jurorNotes count]];
    if ([_juror.jurorNotes count] > 0) {
        detailsView.notes.text = [(VDJurorNote*)[_juror.jurorNotes objectAtIndex:(self.currentNote-1)] notes];
    }
}

#pragma mark - VDJurorDetailsViewDelegate Methods
-(void)jurorDetailsWillClose:(VDJurorDetailsView *)jurorDetails {
    
}
-(void)notesLeftPressed:(VDJurorDetailsView *)jurorDetails {
    if (self.currentNote - 1 > 0) {
        self.currentNote -= 1;
    }
    [self updateJurorDetails:jurorDetails];
}
-(void)notesRightPressed:(VDJurorDetailsView *)jurorDetails {
    if (self.currentNote < [self.juror.jurorNotes count]) {
        self.currentNote += 1;
    }
    [self updateJurorDetails:jurorDetails];
}
#pragma mark ---

@end
