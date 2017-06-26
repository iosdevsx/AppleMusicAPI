//
//  JDTrackListAssembly.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListAssembly.h"

#import "JDTrackListViewController.h"
#import "JDTrackListInteractor.h"
#import "JDTrackListPresenter.h"
#import "JDTrackListRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation JDTrackListAssembly

- (id<RamblerViperModuleFactoryProtocol>)trackListFactory {
    return [TyphoonDefinition withClass:[RamblerViperModuleFactory class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithStoryboard:andRestorationId:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:[self tracksStoryboard]];
                                                  [initializer injectParameterWith:@"JDTrackListViewController"];
                                              }];
                          }];
}

- (UIStoryboard*)tracksStoryboard {
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


- (JDTrackListViewController *)viewTrackList {
    return [TyphoonDefinition withClass:[JDTrackListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterTrackList]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterTrackList]];
                          }];
}

- (JDTrackListInteractor *)interactorTrackList {
    return [TyphoonDefinition withClass:[JDTrackListInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterTrackList]];
                          }];
}

- (JDTrackListPresenter *)presenterTrackList{
    return [TyphoonDefinition withClass:[JDTrackListPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewTrackList]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorTrackList]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerTrackList]];
                          }];
}

- (JDTrackListRouter *)routerTrackList{
    return [TyphoonDefinition withClass:[JDTrackListRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewTrackList]];
                          }];
}

@end
