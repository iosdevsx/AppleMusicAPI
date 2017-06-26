//
//  JDArtistsService.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDArtistsService.h"
#import "JDNetworking.h"
#import "JDRoutes.h"
#import "JDArtistsResponseObject.h"
#import "JDArtist.h"


@implementation JDArtistsService

- (void)searchArtists:(NSString *)searchString
              success:(void(^)(JDArtistsResponseObject *response))success
              failure:(void(^)(NSError *error))failure {
    NSString *str = [searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSDictionary *params = @{@"term":str,
                             @"limit":@(20),
                             @"types":@"artists"};
    
    [[JDNetworking shared].sessionManager GET:SearchArtists parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *artits = [responseObject[@"results"] objectForKey:@"artists"];
        JDArtistsResponseObject *response;
        if ([artits count] == 0) {
            success(response);
            return;
        }
        
        NSError *error = nil;
        response = [[JDArtistsResponseObject alloc] initWithDictionary:artits error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        success(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)infoForSelectedArtists:(JDArtist *)artist
                       success:(void(^)(JDArtistsResponseObject *response))success
                       failure:(void(^)(NSError *error))failure {
    
    NSString *url = [ArtistInfo stringByReplacingOccurrencesOfString:@"{id}" withString:artist.id];
    
    [[JDNetworking shared].sessionManager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        JDArtistsResponseObject *response = [[JDArtistsResponseObject alloc] initWithDictionary:responseObject error:&error];
        
        if (error) {
            failure(error);
            return;
        }
        
        success(response);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
