//
//  JDNetworking.m
//  MarvelApp
//
//  Created by Юрий Логинов on 21.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDNetworking.h"
#import <AFNetworking.h>
#import "JDRoutes.h"
#import "JDConstants.h"

@implementation JDNetworking

+ (instancetype)shared {
    static JDNetworking *networking = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networking = [JDNetworking new];
    });
    return networking;
}

-(AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:AppleMusicURL]];
        
        /*
         * Token hard-coded, because I don't want to show TeamID and PrivateKey.
         * Token expire in 7 days. I hope it enough. But if not, let me know.
         */
        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@", API_TOKEN] forHTTPHeaderField:@"Authorization"];
        
        _sessionManager.requestSerializer = requestSerializer;
    }
    return _sessionManager;
}

@end
