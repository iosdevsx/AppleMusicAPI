//
//  JDTrackListViewController.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "JDTrackListViewInput.h"

@protocol JDTrackListViewOutput;
@protocol RamblerViperModuleConfiguratorProtocol;

@interface JDTrackListViewController : UIViewController <JDTrackListViewInput, RamblerViperModuleTransitionHandlerProtocol>

@property (nonatomic, strong) id<JDTrackListViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@end
