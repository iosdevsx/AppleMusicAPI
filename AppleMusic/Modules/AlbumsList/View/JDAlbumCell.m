//
//  JDAlbumCell.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDAlbumCell.h"
#import "JDAlbum.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface JDAlbumCell()

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;

@end

@implementation JDAlbumCell

-(void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setupWithAlbum:(JDAlbum *)album {
    [self.albumImage sd_setImageWithURL:[NSURL URLWithString:album.formattedUrl]];
}

@end
