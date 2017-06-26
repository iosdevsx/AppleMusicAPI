//
//  JDArtistsListViewController.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDArtistsListViewController.h"
#import "JDArtistsListViewOutput.h"
#import "JDSearchBar.h"
#import <Masonry/Masonry.h>
#import "UIViewController+JD.h"
#import "JDArtistsTableDataSource.h"
#import "JDArtistCell.h"
#import "UINavigationController+Style.h"


@interface JDArtistsListViewController() <JDSearchBarDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *searchContainerView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) JDSearchBar *searchBar;

@property (strong, nonatomic) JDArtistsTableDataSource *dataSource;

@end

@implementation JDArtistsListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Setups

- (void)setupTableView {
    self.tableView.dataSource = self.dataSource;
    [self.containerView addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDArtistCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JDArtistCell class])];
}

- (void)setupSearchBar {
    [self.searchContainerView addSubview:self.searchBar];
}

- (void)setupConstraints {
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.searchContainerView);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView);
    }];
}

#pragma mark - Методы JDArtistsListViewInput

- (void)setupInitialState {
    [self.navigationController setNavigationBarTranslucentStyle];
    self.navigationItem.title = @"Музыканты";
    
    [self setupTableView];
    [self setupSearchBar];
    [self setupConstraints];
}

- (void)updateTable:(NSArray *)items {
    if (!items || items.count == 0) {
        [self showEmptyViewOn:self.containerView title:@"Музыкантов не найдено :("];
    }
    
    self.dataSource.items = items;
    [self.tableView reloadData];
}

- (void)showLoading {
    [self showLoaderOnView:self.containerView];
}

- (void)hideLoading {
    [self hideLoader];
}

- (void)showErrorMessage:(NSString *)error {
    [self showError:error];
}

#pragma mark - JDSearchBarDelegate

- (void)searchViewDidBeginEditing:(JDSearchBar *)searchView {
    //Do nothing
}

- (void)searchViewDidCloseTap:(JDSearchBar *)searchView {
    [self.output handleSearchClose];
}

- (void)searchView:(JDSearchBar *)searchView didEnterText:(NSString *)searchText {
    [self hideEmptyView];
    [self.output handleSearch:searchText];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JDArtist *selectedArtists = self.dataSource.items[indexPath.row];
    [self.output handleArtistSelected:selectedArtists];
}

#pragma mark - Lazy

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(JDSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [JDSearchBar searchBar];
        _searchBar.delegate = self;
    }
    return _searchBar;
}

-(JDArtistsTableDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [JDArtistsTableDataSource new];
    }
    return _dataSource;
}

@end
