//
//  UIViewController+JD.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDLoadingView;

@interface UIViewController (JD)

- (void)setBackButtonWithTarget:(id)target action:(SEL)action;

- (void)showEmptyViewOn:(UIView *)view title:(NSString *)title;
- (void)hideEmptyView;

- (void)showLoaderOnView:(UIView *)view;
- (void)hideLoader;
- (void)showError:(NSString *)error;


@end
