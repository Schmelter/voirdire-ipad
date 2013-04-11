//
//  VDJurorNoteManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDJuror.h"
#import "VDJurorNote.h"

@interface VDJurorNoteManager : NSObject

+(void)notesForJuror:(VDJuror*)juror withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure;

@end
