//
//  JDAlbum.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol JDAlbum;
@protocol JDTrack;

@interface JDAlbum : JSONModel

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString <Optional> *coverUrl;
@property (nonatomic, strong) NSString <Optional> *name;
@property (nonatomic, strong) NSString <Optional> *artistName;
@property (nonatomic, strong) NSArray <JDTrack, Optional> *tracks;


- (NSString *)formattedUrl;

@end
