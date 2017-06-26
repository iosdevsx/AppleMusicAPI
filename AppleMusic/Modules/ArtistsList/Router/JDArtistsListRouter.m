//
//  JDArtistsListRouter.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListRouter.h"
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "JDAlbumsListModuleInput.h"

@implementation JDArtistsListRouter

#pragma mark - Методы JDArtistsListRouterInput

- (void)openAlbumsModule:(JDArtist *)artist {
    [[self.transitionHandler openModuleUsingFactory:self.albumListModuleFactory withTransitionBlock:^(id<RamblerViperModuleTransitionHandlerProtocol> sourceModuleTransitionHandler, id<RamblerViperModuleTransitionHandlerProtocol> destinationModuleTransitionHandler) {
        UIViewController *sourceViewController = (id) sourceModuleTransitionHandler;
        UIViewController *destinationViewController = (id) destinationModuleTransitionHandler;
        [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
    }] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<JDAlbumsListModuleInput> moduleInput) {
        [moduleInput configureModule:artist];
        return nil;
    }];
}

@end
