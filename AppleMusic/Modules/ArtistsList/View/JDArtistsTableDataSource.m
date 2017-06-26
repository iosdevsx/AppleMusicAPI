//
//  JDArtistsTableDataSource.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDArtistsTableDataSource.h"
#import "JDArtistCell.h"

@implementation JDArtistsTableDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JDArtistCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JDArtistCell class])];
    [cell configureFor:self.items[indexPath.row]];
    return cell;
}

@end
