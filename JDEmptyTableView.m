//
//  JDEmptyTableView.m
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import "JDEmptyTableView.h"

@interface JDEmptyTableView()

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation JDEmptyTableView

+ (instancetype)emptyView:(NSString *)title {
    JDEmptyTableView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.mainLabel.text = title;
    return view;
}

@end
