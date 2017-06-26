//
//  JDArtistsListRouterInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDArtist;

@protocol JDArtistsListRouterInput <NSObject>

- (void)openAlbumsModule:(JDArtist *)artist;

@end
