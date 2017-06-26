//
//  JDTrackListHeaderCell.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDTrackListHeaderCell.h"
#import "JDAlbum.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface JDTrackListHeaderCell()

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *artistName;


@end

@implementation JDTrackListHeaderCell

+ (instancetype)cell {
    JDTrackListHeaderCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return cell;
}

- (void)setupForAlbum:(JDAlbum *)album {
    [self.albumImage sd_setImageWithURL:[NSURL URLWithString:album.formattedUrl]];
    self.albumName.text = album.name;
    self.artistName.text = album.artistName;
}

@end
