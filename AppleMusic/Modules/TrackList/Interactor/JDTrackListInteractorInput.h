//
//  JDTrackListInteractorInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDAlbum;

@protocol JDTrackListInteractorInput <NSObject>

- (JDAlbum *)calculateDuration:(JDAlbum *)album;

@end
