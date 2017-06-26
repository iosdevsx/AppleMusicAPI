//
//  JDAlbumsListRouter.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListRouterInput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface JDAlbumsListRouter : NSObject <JDAlbumsListRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (nonatomic,strong) id<RamblerViperModuleFactoryProtocol> trackListModuleFactory;

@end
