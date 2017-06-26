//
//  JDAlbumsFlowLayout.m
//  AppleMusic
//
//  Created by Юрий Логинов on 26.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDAlbumsFlowLayout.h"

@implementation JDAlbumsFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.minimumLineSpacing = 1.0;
        self.minimumInteritemSpacing = 1.0;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return self;
}

- (CGSize)itemSize
{
    NSInteger numberOfColumns = 3;
    
    CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - (numberOfColumns - 1)) / numberOfColumns;
    return CGSizeMake(itemWidth, itemWidth);
}

@end
