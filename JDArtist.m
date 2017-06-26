//
//  JDArtist.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDArtist.h"

@implementation JDArtist

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"name":@"attributes.name",
                                                                  @"genres":@"attributes.genreNames",
                                                                  @"albums":@"relationships.albums.data"}];
}

@end
