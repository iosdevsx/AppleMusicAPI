//
//  JDArtistCell.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDArtistCell.h"
#import "JDArtist.h"

@interface JDArtistCell()

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;

@end

@implementation JDArtistCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cell {
    JDArtistCell *cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return cell;
}

- (void)configureFor:(JDArtist *)artist {
    self.artistLabel.text = artist.name;
    NSMutableString *genres = [NSMutableString string];
    for (NSString *genre in artist.genres) {
        [genres appendString:[NSString stringWithFormat:@"%@ ", genre]];
    }
    self.genreLabel.text = [genres copy];
}

@end
