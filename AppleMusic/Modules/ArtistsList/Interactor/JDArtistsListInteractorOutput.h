//
//  JDArtistsListInteractorOutput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDArtistsListInteractorOutput <NSObject>

- (void)artistsFetchSuccess:(NSArray *)artists;
- (void)artistsFetchFailed:(NSError *)error;

@end
