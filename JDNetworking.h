//
//  JDNetworking.h
//  MarvelApp
//
//  Created by Юрий Логинов on 21.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface JDNetworking : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

+ (instancetype)shared;

@end
