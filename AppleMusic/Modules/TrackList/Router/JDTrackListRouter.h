//
//  JDTrackListRouter.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface JDTrackListRouter : NSObject <JDTrackListRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
