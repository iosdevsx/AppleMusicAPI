//
//  JDArtistsResponseObject.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDArtistsResponseObject.h"

@implementation JDArtistsResponseObject

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"artists":@"data"}];
}

@end
