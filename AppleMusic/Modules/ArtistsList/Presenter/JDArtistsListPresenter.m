//
//  JDArtistsListPresenter.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListPresenter.h"

#import "JDArtistsListViewInput.h"
#import "JDArtistsListInteractorInput.h"
#import "JDArtistsListRouterInput.h"

@interface JDArtistsListPresenter()

@property (nonatomic, strong) NSTimer *searchTimer;

@end

@implementation JDArtistsListPresenter

#pragma mark - Методы JDArtistsListModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы JDArtistsListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    
    //Should fetch cached artists from CoreData, but haven't time for realize it ;(
    [self.view updateTable:nil];
}

- (void)handleSearch:(NSString *)searchText {
    
    if (searchText.length == 0) {
        [self.view hideLoading];
        [self.view updateTable:nil];
        return;
    }
    
    [self.view showLoading];
    [self.searchTimer invalidate];
    self.searchTimer = nil;
    
    __weak JDArtistsListPresenter *weakSelf = self;
    self.searchTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [weakSelf.interactor fetchArtists:searchText];
        [weakSelf.searchTimer invalidate];
    }];
}

- (void)handleArtistSelected:(JDArtist *)artist {
    [self.router openAlbumsModule:artist];
}

- (void)handleSearchClose {
    [self.view updateTable:nil];
}

#pragma mark - Методы JDArtistsListInteractorOutput

- (void)artistsFetchSuccess:(NSArray *)artists {
    [self.view updateTable:artists];
    [self.view hideLoading];
}

- (void)artistsFetchFailed:(NSError *)error {
    [self.view hideLoading];
    [self.view showErrorMessage:[error localizedDescription]];
}

@end
