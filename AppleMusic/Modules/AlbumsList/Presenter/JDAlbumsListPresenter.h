//
//  JDAlbumsListPresenter.h
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListViewOutput.h"
#import "JDAlbumsListInteractorOutput.h"
#import "JDAlbumsListModuleInput.h"

@protocol JDAlbumsListViewInput;
@protocol JDAlbumsListInteractorInput;
@protocol JDAlbumsListRouterInput;

@interface JDAlbumsListPresenter : NSObject <JDAlbumsListModuleInput, JDAlbumsListViewOutput, JDAlbumsListInteractorOutput>

@property (nonatomic, weak) id<JDAlbumsListViewInput> view;
@property (nonatomic, strong) id<JDAlbumsListInteractorInput> interactor;
@property (nonatomic, strong) id<JDAlbumsListRouterInput> router;

@end
