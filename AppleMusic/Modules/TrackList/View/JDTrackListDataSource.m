//
//  JDTrackListDataSource.m
//  AppleMusic
//
//  Created by Юрий Логинов on 26.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDTrackListDataSource.h"
#import "JDTrackListHeaderCell.h"
#import "JDAlbum.h"
#import "JDTrackCell.h"
#import "JDTrack.h"


@implementation JDTrackListDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.album.tracks.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        JDTrackListHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDTrackListHeaderCell class])];
        [cell setupForAlbum:self.album];
        return cell;
    }
    
    JDTrack *currentTrack = self.album.tracks[indexPath.row - 1];
    JDTrackCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDTrackCell class])];
    [cell setupWithTrack:currentTrack number:indexPath.row - 1];
    return cell;
}

@end
