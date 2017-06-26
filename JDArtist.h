//
//  JDArtist.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol JDArtist;
@protocol JDAlbum;

@interface JDArtist : JSONModel

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *genres;
@property (strong, nonatomic) NSArray <JDAlbum, Optional> *albums;

@end
