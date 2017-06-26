//
//  JDAlbumsListViewController.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDAlbumsListViewController.h"
#import "UIViewController+JD.h"
#import "JDAlbumsListViewOutput.h"
#import "JDAlbumCell.h"
#import "JDAlbumsDataSource.h"
#import "JDAlbum.h"
#import "JDAlbumsFlowLayout.h"
#import "UINavigationController+Style.h"


@interface JDAlbumsListViewController() <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) JDAlbumsDataSource *dataSource;

@end

@implementation JDAlbumsListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDAlbumsListViewInput

- (void)setupInitialState {
    self.navigationItem.title = NSLocalizedString(@"albums-title", nil);
    [self setBackButtonWithTarget:self action:@selector(actionBack)];
    
    self.collectionView.dataSource = self.dataSource;
    self.collectionView.collectionViewLayout = [JDAlbumsFlowLayout new];
}

- (void)showLoading {
    [self showLoaderOnView:self.view];
}

- (void)hideLoading {
    [self hideLoader];
}

- (void)showErrorMessage:(NSString *)error {
    [self showError:error];
}

- (void)updateCollection:(NSArray *)items {
    self.dataSource.items = items;
    [self.collectionView reloadData];
}

- (void)actionBack {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UICollectionViewDelegate 

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JDAlbum *selectedAlbum = self.dataSource.items[indexPath.row];
    [self.output handleAlbumSelected:selectedAlbum];
}

#pragma mark - Lazy

-(JDAlbumsDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [JDAlbumsDataSource new];
    }
    return _dataSource;
}

@end
