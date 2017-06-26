//
//  JDTrackListInteractor.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListInteractorInput.h"

@protocol JDTrackListInteractorOutput;

@interface JDTrackListInteractor : NSObject <JDTrackListInteractorInput>

@property (nonatomic, weak) id<JDTrackListInteractorOutput> output;

@end
