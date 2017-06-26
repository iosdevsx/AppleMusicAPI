//
//  JDTrackCell.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDTrackCell.h"
#import "JDTrack.h"

@interface JDTrackCell()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;


@end

@implementation JDTrackCell

- (void)setupWithTrack:(JDTrack *)track number:(NSInteger)number {
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (unsigned long)number];
    self.trackLabel.text = track.name;
}

@end
