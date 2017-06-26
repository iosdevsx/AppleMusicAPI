//
//  JDAlbumsListViewOutput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JDAlbum;

@protocol JDAlbumsListViewOutput <NSObject>

/**
 @author Yury Loginov

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;
- (void)handleAlbumSelected:(JDAlbum *)album;

@end
