//
//  JDTrackListAssembly.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "JDTrackListModuleFactory.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

/**
 @author Yury Loginov

 TrackList module
 */
@interface JDTrackListAssembly : TyphoonAssembly <JDTrackListModuleFactory>

- (id<RamblerViperModuleFactoryProtocol>)trackListFactory;

@end
