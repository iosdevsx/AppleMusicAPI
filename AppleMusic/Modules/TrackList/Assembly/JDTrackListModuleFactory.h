//
//  JDTrackListModuleFactory.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDTrackListModuleInput;

@protocol JDTrackListModuleFactory <NSObject>

- (id <JDTrackListModuleInput>)presenterTrackList;

@end
