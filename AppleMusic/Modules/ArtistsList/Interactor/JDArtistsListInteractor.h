//
//  JDArtistsListInteractor.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListInteractorInput.h"


@class JDArtistsService;

@protocol JDArtistsListInteractorOutput;

@interface JDArtistsListInteractor : NSObject <JDArtistsListInteractorInput>

@property (nonatomic, weak) id<JDArtistsListInteractorOutput> output;
@property (nonatomic, strong) JDArtistsService *artistsService;

@end
