//
//  JDAlbumsListInteractorOutput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDAlbumsListInteractorOutput <NSObject>

- (void)albumsIdsFetched:(NSArray *)ids;
- (void)albumsIdsFetchFailed:(NSError *)error;

- (void)albumsFetched:(NSArray *)albums;
- (void)albumsFetchFailed:(NSError *)error;

@end
