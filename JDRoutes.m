//
//  JDRoutes.m
//  MarvelApp
//
//  Created by Юрий Логинов on 21.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDRoutes.h"

@implementation JDRoutes

NSString *const BaseURL = @"https://gateway.marvel.com";
NSString *const CharacterList = @"/v1/public/characters";
NSString *const AppleMusicURL = @"https://api.music.apple.com";
NSString *const PlaylistURL = @"/v1/catalog/us/playlists/pl.acc464c750b94302b8806e5fcbe56e17";
NSString *const SearchArtists = @"/v1/catalog/ru/search";
NSString *const ArtistInfo = @"/v1/catalog/ru/artists/{id}";
NSString *const AlbumsInfo = @"/v1/catalog/ru/albums";

@end
