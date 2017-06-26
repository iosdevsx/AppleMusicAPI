//
//  JDTrackListDataSource.h
//  AppleMusic
//
//  Created by Юрий Логинов on 26.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JDAlbum;

@interface JDTrackListDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) JDAlbum *album;

@end
