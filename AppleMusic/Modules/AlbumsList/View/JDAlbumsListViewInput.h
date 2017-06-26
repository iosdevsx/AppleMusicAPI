//
//  JDAlbumsListViewInput.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JDAlbumsListViewInput <NSObject>

/**
 @author Yury Loginov

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;
- (void)showLoading;
- (void)hideLoading;
- (void)updateCollection:(NSArray *)items;
- (void)showErrorMessage:(NSString *)error;

@end
