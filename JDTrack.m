//
//  JDTrack.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDTrack.h"

@implementation JDTrack

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"name":@"attributes.name"}];
}

@end
