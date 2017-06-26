//
//  JDAlbumsListRouter.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListRouter.h"
#import "JDAlbum.h"
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "JDTrackListModuleInput.h"

@implementation JDAlbumsListRouter

#pragma mark - Методы JDAlbumsListRouterInput

- (void)openTrackListModuleWith:(JDAlbum *)album {
    [[self.transitionHandler openModuleUsingFactory:self.trackListModuleFactory withTransitionBlock:^(id<RamblerViperModuleTransitionHandlerProtocol> sourceModuleTransitionHandler, id<RamblerViperModuleTransitionHandlerProtocol> destinationModuleTransitionHandler) {
        UIViewController *sourceViewController = (id) sourceModuleTransitionHandler;
        UIViewController *destinationViewController = (id) destinationModuleTransitionHandler;
        [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
    }] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<JDTrackListModuleInput> moduleInput) {
        [moduleInput configureModule:album];
        return nil;
    }];
}

@end
