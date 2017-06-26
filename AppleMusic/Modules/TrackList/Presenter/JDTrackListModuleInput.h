//
//  JDTrackListModuleInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>


@class JDAlbum;

@protocol JDTrackListModuleInput <RamblerViperModuleInput>

/**
 @author Yury Loginov

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule:(JDAlbum *)album;

@end
