//
//  JDAlbumsDataSource.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDAlbumsDataSource.h"
#import "JDAlbumCell.h"


@implementation JDAlbumsDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JDAlbumCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([JDAlbumCell class]) forIndexPath:indexPath];
    [cell setupWithAlbum:self.items[indexPath.row]];
    return cell;
}

@end
