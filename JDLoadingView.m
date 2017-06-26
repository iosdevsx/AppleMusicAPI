//
//  JDLoadingView.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDLoadingView.h"

@implementation JDLoadingView

+ (instancetype)view {
    JDLoadingView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}

@end
