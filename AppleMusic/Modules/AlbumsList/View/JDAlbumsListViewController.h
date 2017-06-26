//
//  JDAlbumsListViewController.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "JDAlbumsListViewInput.h"

@protocol JDAlbumsListViewOutput;
@protocol RamblerViperModuleConfiguratorProtocol;

@interface JDAlbumsListViewController : UIViewController <JDAlbumsListViewInput, RamblerViperModuleTransitionHandlerProtocol>

@property (nonatomic, strong) id<JDAlbumsListViewOutput> output;
@property (nonatomic, weak)   id<RamblerViperModuleConfiguratorProtocol> moduleConfigurator;

@end
