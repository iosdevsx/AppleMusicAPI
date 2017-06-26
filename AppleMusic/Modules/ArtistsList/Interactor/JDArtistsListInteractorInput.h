//
//  JDArtistsListInteractorInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDArtistsListInteractorInput <NSObject>

- (void)fetchArtists:(NSString *)searchText;

@end
