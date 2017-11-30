//
//  JDTrackListInteractor.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListInteractor.h"
#import "JDAlbum.h"
#import "JDTrackListInteractorOutput.h"


@implementation JDTrackListInteractor

#pragma mark - Методы JDTrackListInteractorInput

- (JDAlbum *)calculateDuration:(JDAlbum *)album {
    NSNumber *totalDuration = [album.tracks valueForKeyPath:@"@sum.duration"];
    album.totalDuration = totalDuration;
    return album;
}

@end
