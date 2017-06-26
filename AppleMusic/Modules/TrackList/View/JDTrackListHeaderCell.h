//
//  JDTrackListHeaderCell.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDAlbum;

@interface JDTrackListHeaderCell : UITableViewCell

+ (instancetype)cell;
- (void)setupForAlbum:(JDAlbum *)album;

@end
