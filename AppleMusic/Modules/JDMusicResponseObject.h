//
//  JDMusicResponseObject.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>

@protocol JDAlbum;

@interface JDMusicResponseObject : JSONModel

@property (nonatomic, strong) NSArray <JDAlbum> *albums;

@end
