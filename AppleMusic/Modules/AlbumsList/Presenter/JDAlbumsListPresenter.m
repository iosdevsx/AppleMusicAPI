//
//  JDAlbumsListPresenter.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListPresenter.h"
#import "JDArtist.h"
#import "JDAlbumsListViewInput.h"
#import "JDAlbumsListInteractorInput.h"
#import "JDAlbumsListRouterInput.h"


@interface JDAlbumsListPresenter()

@property (nonatomic, strong) JDArtist *artist;

@end

@implementation JDAlbumsListPresenter

#pragma mark - Методы JDAlbumsListModuleInput

- (void)configureModule:(JDArtist *)artist {
    self.artist = artist;
}

#pragma mark - Методы JDAlbumsListViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.view showLoading];
    [self.interactor fetchAlbumsIdsForArtist:self.artist];
}

- (void)handleAlbumSelected:(JDAlbum *)album {
    [self.router openTrackListModuleWith:album];
}

#pragma mark - Методы JDAlbumsListInteractorOutput

- (void)albumsIdsFetched:(NSArray *)ids {
    [self.interactor fetchAlbumsForIds:ids];
}

- (void)albumsIdsFetchFailed:(NSError *)error {
    if (error) {
        [self.view showErrorMessage:error.localizedDescription];
        return;
    }
    [self.view showErrorMessage:NSLocalizedString(@"raise-error", nil)];
}

- (void)albumsFetched:(NSArray *)albums {
    [self.view hideLoading];
    [self.view updateCollection:albums];
}

- (void)albumsFetchFailed:(NSError *)error {
    if (error) {
        [self.view showErrorMessage:error.localizedDescription];
        return;
    }
    [self.view showErrorMessage:NSLocalizedString(@"raise-error", nil)];
}

@end
