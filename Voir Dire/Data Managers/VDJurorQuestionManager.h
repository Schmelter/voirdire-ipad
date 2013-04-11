//
//  VDJurorQuestionManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 4/11/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDJurorQuestion.h"
#import "VDJuror.h"

@interface VDJurorQuestionManager : NSObject {
@private
}

+(void)questionsForJuror:(VDJuror*)juror withSuccessHandler:(void(^)(NSMutableArray*))success withFailure:(void(^)(NSError*)) failure;

@end
