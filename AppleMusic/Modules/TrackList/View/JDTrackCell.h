//
//  JDTrackCell.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDTrack;

@interface JDTrackCell : UITableViewCell

- (void)setupWithTrack:(JDTrack *)track number:(NSInteger)number;

@end
