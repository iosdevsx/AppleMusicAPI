//
//  JDTrackListPresenter.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListViewOutput.h"
#import "JDTrackListInteractorOutput.h"
#import "JDTrackListModuleInput.h"

@protocol JDTrackListViewInput;
@protocol JDTrackListInteractorInput;
@protocol JDTrackListRouterInput;

@interface JDTrackListPresenter : NSObject <JDTrackListModuleInput, JDTrackListViewOutput, JDTrackListInteractorOutput>

@property (nonatomic, weak) id<JDTrackListViewInput> view;
@property (nonatomic, strong) id<JDTrackListInteractorInput> interactor;
@property (nonatomic, strong) id<JDTrackListRouterInput> router;

@end
