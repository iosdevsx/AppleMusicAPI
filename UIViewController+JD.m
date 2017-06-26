//
//  UIViewController+JD.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "UIViewController+JD.h"
#import "JDLoadingView.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>
#import "JDPopup.h"
#import "JDEmptyTableView.h"


static void const *keyLoader;
static void const *keyEmptyView;

@interface UIViewController()

@property (strong, nonatomic) JDLoadingView *loader;
@property (strong, nonatomic) JDEmptyTableView *emptyView;

@end

@implementation UIViewController (JD)

- (void)setBackButtonWithTarget:(id)target action:(SEL)action {
    UIImage *backImage = [UIImage imageNamed:@"arrowLeft"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:target action:action];
}

- (void)showEmptyViewOn:(UIView *)view title:(NSString *)title {
    if (self.emptyView) {
        return;
    }
    
    self.emptyView = [JDEmptyTableView emptyView:title];
    [view addSubview:self.emptyView];
    
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}

- (void)hideEmptyView {
    [self.emptyView removeFromSuperview];
    self.emptyView = nil;
}

- (void)showLoaderOnView:(UIView *)view {
    if (self.loader) {
        return;
    }
    
    self.loader = [JDLoadingView view];
    [view addSubview:self.loader];
    
    [self.loader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}

- (void)hideLoader {
    [self.loader removeFromSuperview];
    self.loader = nil;
}

- (void)showError:(NSString *)error {
    [JDPopup showPopupWithText:error];
}

#pragma mark - Getters & Setters

- (void)setLoader:(JDLoadingView *)loader {
    objc_setAssociatedObject(self, &keyLoader, loader, OBJC_ASSOCIATION_RETAIN);
}

- (JDLoadingView *)loader {
    return objc_getAssociatedObject(self, &keyLoader);
}

- (void)setEmptyView:(JDEmptyTableView *)emptyView {
    objc_setAssociatedObject(self, &keyEmptyView, emptyView, OBJC_ASSOCIATION_RETAIN);
}

- (JDEmptyTableView *)emptyView {
    return objc_getAssociatedObject(self, &keyEmptyView);
}

@end
