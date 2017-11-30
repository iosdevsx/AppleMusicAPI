//
//  JDTrackListPresenter.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListPresenter.h"
#import "JDAlbum.h"
#import "JDTrackListViewInput.h"
#import "JDTrackListInteractorInput.h"
#import "JDTrackListRouterInput.h"

@interface JDTrackListPresenter()

@property (nonatomic, strong) JDAlbum *album;

@end

@implementation JDTrackListPresenter

#pragma mark - Методы JDTrackListModuleInput

- (void)configureModule:(JDAlbum *)album {
    self.album = album;
}

#pragma mark - Методы JDTrackListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    self.album = [self.interactor calculateDuration:self.album];
    [self.view updateTableForAlbum:self.album];
}

#pragma mark - Методы JDTrackListInteractorOutput

@end
