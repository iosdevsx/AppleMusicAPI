//
//  JDArtistsListInteractor.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListInteractor.h"
#import "JDArtistsService.h"
#import "JDArtistsListInteractorOutput.h"
#import "JDArtistsResponseObject.h"

@implementation JDArtistsListInteractor

#pragma mark - Методы JDArtistsListInteractorInput

- (void)fetchArtists:(NSString *)searchText {
    [self.artistsService searchArtists:searchText success:^(JDArtistsResponseObject *response) {
        [self.output artistsFetchSuccess:response.artists];
    } failure:^(NSError *error) {
        [self.output artistsFetchFailed:error];
    }];
}

@end
