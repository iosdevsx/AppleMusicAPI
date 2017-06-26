//
//  JDAlbumsListInteractor.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListInteractorInput.h"
#import "JDArtistsService.h"
#import "JDMusicService.h"

@protocol JDAlbumsListInteractorOutput;

@interface JDAlbumsListInteractor : NSObject <JDAlbumsListInteractorInput>

@property (nonatomic, weak) id<JDAlbumsListInteractorOutput> output;
@property (nonatomic, strong) JDArtistsService *artistsService;
@property (nonatomic, strong) JDMusicService *musicService;

@end
