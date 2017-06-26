//
//  JDTrackListViewInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDAlbum;

@protocol JDTrackListViewInput <NSObject>

/**
 @author Yury Loginov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)updateTableForAlbum:(JDAlbum *)album;

@end
