//
//  VDJurorManager.h
//  Voir Dire
//
//  Created by Greg Schmelter on 3/20/13.
//  Copyright (c) 2013 Voir Dire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VDJuror.h"
#import "VDTrialCase.h"

@interface VDJurorManager : NSObject {
    @private
}

-(void)jurorsForTrialCase:(VDTrialCase*)trialCase withSuccessHandler:(void(^)(NSArray*))success withFailure:(void(^)(NSError*))failure;

@end
