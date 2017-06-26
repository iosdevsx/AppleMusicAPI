//
//  JDMusicResponseObject.m
//  MarvelApp
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDMusicResponseObject.h"

@implementation JDMusicResponseObject

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"albums":@"data"}];
}

@end
