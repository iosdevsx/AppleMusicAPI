//
//  JDMusicService.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDMusicService.h"
#import "JDMusicResponseObject.h"
#import "JDRoutes.h"
#import "JDNetworking.h"
#import "JDMusicResponseObject.h"
#import "JDArtist.h"


@implementation JDMusicService

- (void)fetchAlbumsInfoFor:(NSArray *)ids
                   success:(void(^)(JDMusicResponseObject *response))success
                   failure:(void(^)(NSError *error))failure {
    
    NSMutableString *identifiers = [NSMutableString string];
    for (NSString *identifier in ids) {
        [identifiers appendString:[NSString stringWithFormat:@"%@,", identifier]];
    }   
    
    NSString *idsResult = [identifiers substringToIndex:identifiers.length - 1];
    
    NSDictionary *params = @{@"ids":idsResult};
    
    [[JDNetworking shared].sessionManager GET:AlbumsInfo parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = nil;
        JDMusicResponseObject *response = [[JDMusicResponseObject alloc] initWithDictionary:responseObject error:&error];
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
