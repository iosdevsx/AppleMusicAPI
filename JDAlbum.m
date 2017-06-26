//
//  JDAlbum.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDAlbum.h"

@implementation JDAlbum

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"tracks":@"relationships.tracks.data",
                                                                  @"coverUrl":@"attributes.artwork.url",
                                                                  @"name":@"attributes.name",
                                                                  @"artistName":@"attributes.artistName"}];
}

- (NSString *)formattedUrl {
    NSString *url = self.coverUrl;
    NSRange range = [url rangeOfString:@"{w}x{h}bb"];
    url = [url stringByReplacingOccurrencesOfString:@"{w}x{h}bb" withString:@"200x200bb" options:NSCaseInsensitiveSearch range:range];
    return url;
}

@end
