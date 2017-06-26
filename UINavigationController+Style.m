//
//  UINavigationController+Style.m
//  AppleMusic
//
//  Created by Юрий Логинов on 26.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "UINavigationController+Style.h"

@implementation UINavigationController (Style)

- (void)setNavigationBarTranslucentStyle {
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor],
                                               NSFontAttributeName: [UIFont systemFontOfSize:14.0f weight:UIFontWeightRegular]};
}

@end
