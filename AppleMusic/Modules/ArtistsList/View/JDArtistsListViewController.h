//
//  JDArtistsListViewController.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JDArtistsListViewInput.h"

@protocol JDArtistsListViewOutput;

@interface JDArtistsListViewController : UIViewController <JDArtistsListViewInput>

@property (nonatomic, strong) id<JDArtistsListViewOutput> output;

@end
