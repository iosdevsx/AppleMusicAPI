//
//  JDAlbumsListAssembly.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListAssembly.h"
#import "JDAlbumsListViewController.h"
#import "JDAlbumsListInteractor.h"
#import "JDAlbumsListPresenter.h"
#import "JDAlbumsListRouter.h"
#import "JDTrackListAssembly.h"


@interface JDAlbumsListAssembly()

@property (nonatomic, strong) JDTrackListAssembly *trackListAssembly;

@end

@implementation JDAlbumsListAssembly

- (id<RamblerViperModuleFactoryProtocol>)albumsListFactory {
    return [TyphoonDefinition withClass:[RamblerViperModuleFactory class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithStoryboard:andRestorationId:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:[self storyboard]];
                                                  [initializer injectParameterWith:@"JDAlbumsListViewController"];
                                              }];
                          }];
}

- (UIStoryboard*)storyboard {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:@"Main"];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:nil];
                                              }];
                          }];
}

- (JDAlbumsListViewController *)viewAlbumsList {
    return [TyphoonDefinition withClass:[JDAlbumsListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAlbumsList]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterAlbumsList]];
                          }];
}

- (JDAlbumsListInteractor *)interactorAlbumsList {
    return [TyphoonDefinition withClass:[JDAlbumsListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAlbumsList]];
                          }];
}

- (JDAlbumsListPresenter *)presenterAlbumsList{
    return [TyphoonDefinition withClass:[JDAlbumsListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewAlbumsList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorAlbumsList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerAlbumsList]];
                          }];
}

- (JDAlbumsListRouter *)routerAlbumsList{
    return [TyphoonDefinition withClass:[JDAlbumsListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewAlbumsList]];
                              [definition injectProperty:@selector(trackListModuleFactory) with:self.trackListAssembly.trackListFactory];
                          }];
}

@end
