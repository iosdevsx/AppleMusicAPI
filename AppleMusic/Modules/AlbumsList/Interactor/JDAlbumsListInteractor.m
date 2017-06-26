//
//  JDAlbumsListInteractor.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListInteractor.h"
#import "JDAlbumsListInteractorOutput.h"
#import "JDArtistsResponseObject.h"
#import "JDArtist.h"
#import "JDAlbum.h"
#import "JDMusicService.h"
#import "JDMusicResponseObject.h"


@implementation JDAlbumsListInteractor

- (instancetype)init
{
    self = [super init];
    if (self) {
        _artistsService = [JDArtistsService new];
        _musicService = [JDMusicService new];
    }
    return self;
}

#pragma mark - Методы JDAlbumsListInteractorInput

- (void)fetchAlbumsIdsForArtist:(JDArtist *)artist {
    [self.artistsService infoForSelectedArtists:artist success:^(JDArtistsResponseObject *response) {
        JDArtist *artist = response.artists.firstObject;
        if (!artist) {
            [self.output albumsIdsFetchFailed:nil];
            return;
        }
        
        NSMutableArray *ids = [NSMutableArray array];
        for (JDAlbum *album in artist.albums) {
            [ids addObject:album.id];
        }
        [self.output albumsIdsFetched:ids];
        
    } failure:^(NSError *error) {
        [self.output albumsIdsFetchFailed:error];
    }];
}

- (void)fetchAlbumsForIds:(NSArray *)ids {
    [self.musicService fetchAlbumsInfoFor:ids success:^(JDMusicResponseObject *response) {
        [self.output albumsFetched:response.albums];
    } failure:^(NSError *error) {
        [self.output albumsFetchFailed:error];
    }];
}

@end
