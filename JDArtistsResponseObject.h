//
//  JDArtistsResponseObject.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol JDArtist;

@interface JDArtistsResponseObject : JSONModel

@property (nonatomic, strong) NSArray <JDArtist> *artists;

@end
