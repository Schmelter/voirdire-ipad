//
//  VDJurorNoteManager.m
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import "VDJurorNoteManager.h"

static NSMutableDictionary *jurorIDToJurorNotes = nil;

@implementation VDJurorNoteManager

-(id)init {
    return nil;
}

+(void)notesForJuror:(VDJuror*)juror withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jurorIDToJurorNotes = [[NSMutableDictionary alloc] initWithCapacity:5];
    });
    
    NSMutableArray *notes = [jurorIDToJurorNotes objectForKey:[NSNumber numberWithInt:juror.jurorID]];
    if (notes == nil) {
        NSInteger noteCount = (arc4random() % 20) + 1;
        notes = [[NSMutableArray alloc] initWithCapacity:noteCount];
        for (NSInteger i = 0; i < noteCount; i++) {
            VDJurorNote *note = [[VDJurorNote alloc] init];
            note.jurorNoteID = i;
            note.jurorNoteID = juror.jurorID;
            note.trialCaseID = juror.trialCaseID;
            note.dateTimeStamp = [NSDate dateWithTimeIntervalSinceNow:-50000];
            note.notes = [NSString stringWithFormat:@"Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i Example Note #%i", i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i];
            
            [notes addObject:note];
        }
        [jurorIDToJurorNotes setObject:notes forKey:[NSNumber numberWithInt:juror.jurorID]];
    }
    success(notes);
}

@end
