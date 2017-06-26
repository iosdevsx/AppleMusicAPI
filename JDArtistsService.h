//
//  JDArtistsService.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>


@class JDArtistsResponseObject;
@class JDArtist;

@interface JDArtistsService : NSObject


/**
 Search Artists

 @param searchString search string
 @param success success block raise, if request and response is correct
 @param failure failure block raise, if something went wrong
 */
- (void)searchArtists:(NSString *)searchString
              success:(void(^)(JDArtistsResponseObject *response))success
              failure:(void(^)(NSError *error))failure;

/**
 Fill information about selected artist

 @param artist selected artist object
 @param success success block raise, if request and response is correct
 @param failure failure block raise, if something went wrong
 */
- (void)infoForSelectedArtists:(JDArtist *)artist
                       success:(void(^)(JDArtistsResponseObject *response))success
                       failure:(void(^)(NSError *error))failure;

@end
