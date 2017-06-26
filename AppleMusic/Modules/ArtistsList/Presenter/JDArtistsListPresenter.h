//
//  JDArtistsListPresenter.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListViewOutput.h"
#import "JDArtistsListInteractorOutput.h"
#import "JDArtistsListModuleInput.h"

@protocol JDArtistsListViewInput;
@protocol JDArtistsListInteractorInput;
@protocol JDArtistsListRouterInput;

@interface JDArtistsListPresenter : NSObject <JDArtistsListModuleInput, JDArtistsListViewOutput, JDArtistsListInteractorOutput>

@property (nonatomic, weak) id<JDArtistsListViewInput> view;
@property (nonatomic, strong) id<JDArtistsListInteractorInput> interactor;
@property (nonatomic, strong) id<JDArtistsListRouterInput> router;

@end
