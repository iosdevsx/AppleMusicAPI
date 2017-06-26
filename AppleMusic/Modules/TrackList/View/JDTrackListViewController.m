//
//  JDTrackListViewController.m
//  AppleMusic
//
//  Created by Yury Loginov on 25/06/2017.
//  Copyright © 2017 JD. All rights reserved.
//

#import "JDTrackListViewController.h"
#import "JDTrackListViewOutput.h"
#import "JDTrackCell.h"
#import "JDTrackListHeaderCell.h"
#import "JDTrackListDataSource.h"
#import "UIViewController+JD.h"

@interface JDTrackListViewController() <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) JDTrackListDataSource *dataSource;


@end

@implementation JDTrackListViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы JDTrackListViewInput

- (void)setupTableView {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDTrackListHeaderCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JDTrackListHeaderCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JDTrackCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([JDTrackCell class])];
    self.tableView.dataSource = self.dataSource;
}

- (void)setupInitialState {
    [self setBackButtonWithTarget:self action:@selector(actionBack)];
	self.navigationItem.title = NSLocalizedString(@"songs-title", nil);
    [self setupTableView];
}

- (void)updateTableForAlbum:(JDAlbum *)album {
    self.dataSource.album = album;
    [self.tableView reloadData];
}

- (void)actionBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Lazy

-(JDTrackListDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [JDTrackListDataSource new];
    }
    return _dataSource;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 130.f;
    }
    
    return 55.f;
}

@end
