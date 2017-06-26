//
//  JDArtistsTableDataSource.h
//  AppleMusic
//
//  Created by Юрий Логинов on 25.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JDArtistsTableDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *items;

@end
