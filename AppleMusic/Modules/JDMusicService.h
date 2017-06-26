//
//  JDMusicService.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDMusicResponseObject;
@class JDArtist;

@interface JDMusicService : NSObject

/**
 Get albums info using albums identifiers

 @param ids Array of album's identifiers
 @param success success block raise, if request and response is correct
 @param failure failure block raise, if something went wrong
 */
- (void)fetchAlbumsInfoFor:(NSArray *)ids
                   success:(void(^)(JDMusicResponseObject *response))success
                   failure:(void(^)(NSError *error))failure;

@end
