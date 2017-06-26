//
//  JDSearchBar.h
//  MarvelApp
//
//  Created by Юрий Логинов on 24.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDSearchBar;

@protocol JDSearchBarDelegate <NSObject>

- (void)searchViewDidBeginEditing:(JDSearchBar *)searchView;
- (void)searchViewDidCloseTap:(JDSearchBar *)searchView;
- (void)searchView:(JDSearchBar *)searchView didEnterText:(NSString *)searchText;

@end

@interface JDSearchBar : UIView

@property (weak, nonatomic) id<JDSearchBarDelegate> delegate;

+ (instancetype)searchBar;
- (NSString *)searchText;

@end
