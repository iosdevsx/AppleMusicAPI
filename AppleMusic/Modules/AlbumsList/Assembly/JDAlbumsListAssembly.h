//
//  JDAlbumsListAssembly.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "JDAlbumsListModuleFactory.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

/**
 @author Yury Loginov

 AlbumsList module
 */
@interface JDAlbumsListAssembly : TyphoonAssembly <JDAlbumsListModuleFactory>

- (id<RamblerViperModuleFactoryProtocol>)albumsListFactory;

@end
