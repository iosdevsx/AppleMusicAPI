//
//  JDArtistsListAssembly.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListAssembly.h"

#import "JDArtistsListViewController.h"
#import "JDArtistsListInteractor.h"
#import "JDArtistsListPresenter.h"
#import "JDArtistsListRouter.h"
#import "JDArtistsService.h"
#import "JDAlbumsListAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>


@interface JDArtistsListAssembly()

@property (nonatomic, strong) JDAlbumsListAssembly *albumsAssembly;

@end

@implementation JDArtistsListAssembly

- (JDArtistsListViewController *)viewArtistsList {
    return [TyphoonDefinition withClass:[JDArtistsListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterArtistsList]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterArtistsList]];
                          }];
}

- (JDArtistsListInteractor *)interactorArtistsList {
    return [TyphoonDefinition withClass:[JDArtistsListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterArtistsList]];
                              [definition injectProperty:@selector(artistsService) with:[self artistsService]];
                          }];
}

- (JDArtistsService *)artistsService {
    return [TyphoonDefinition withClass:[JDArtistsService class]];
}

- (JDArtistsListPresenter *)presenterArtistsList{
    return [TyphoonDefinition withClass:[JDArtistsListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewArtistsList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorArtistsList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerArtistsList]];
                          }];
}

- (JDArtistsListRouter *)routerArtistsList{
    return [TyphoonDefinition withClass:[JDArtistsListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewArtistsList]];
                              [definition injectProperty:@selector(albumListModuleFactory) with:[self.albumsAssembly albumsListFactory]];
                          }];
}

@end
