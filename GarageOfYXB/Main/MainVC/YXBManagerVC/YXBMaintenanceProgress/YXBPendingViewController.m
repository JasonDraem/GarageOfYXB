//
//  YXBPendingViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBPendingViewController.h"
#import "YXBMangerPendingTableViewCell.h"
#import "YXBPendingDetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBPendingViewController ()<UITableViewDelegate, UITableViewDataSource, YXBMangerPendingTableViewCellDelegate>
{
    MBProgressHUD *_hud;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *pendingDataSource;

@end

static NSString *YXBMangerPendingTableViewCellId = @"YXBMangerPendingTableViewCellId";

@implementation YXBPendingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.view addSubview:self.tableView];
    [self.tableView.mj_header beginRefreshing];
}

/**
 *  懒加载tableview
 *
 *  @return <#return value description#>
 */
- (UITableView*)tableView{
    weakify(self)
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:XXYScreenBounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        [_tableView registerNib:[UINib nibWithNibName:@"YXBMangerPendingTableViewCell" bundle:nil] forCellReuseIdentifier:YXBMangerPendingTableViewCellId];
        [self.view addSubview:_tableView];
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weak_self getDataHeaderRefresh];
        }];
        self.tableView.mj_header = header;
        //更改默认刷新提示语
        [self changeStatesText:header];
    }
    return _tableView;
}
/**
 *  懒加载datasource
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)pendingDataSource{
    if (!_pendingDataSource) {
        _pendingDataSource = [[NSMutableArray alloc] init];
    }
    return _pendingDataSource;
}


- (void)getDataHeaderRefresh{
    //weakify(self)
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    
    if (0 == self.pendingDataSource.count) {
        [self showMBProgress:@"loading......"];
    }
    for (NSInteger i = 0; i < 10; i ++) {
        [self.pendingDataSource addObject:@(i)];
        [self.tableView reloadData];
    }
    _getDataType = XXYGetDataNormalRefresh;
    [self dismissMBProgress];
}
/**
 *  tableView refresh
 */
- (void)beginRefreshData{
    weakify(self)
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weak_self getDataHeaderRefresh];
    }];
    self.tableView.mj_header = header;
    //更改默认刷新提示语
    [self changeStatesText:header];
    //开始刷新
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pendingDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YXBMangerPendingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YXBMangerPendingTableViewCellId];
    cell.cellDelegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30 * kViewHeightScale;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = XXYColor(27, 156, 253.0, .7);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"2016年9月";
    return label;
}

#pragma mark - YXBMangerPendingTableViewCellDelegate
- (void)clickPendingButtonHandler{
    //[self showMBProgress:@"暂时无法查看"];
    //[self dismissMBProgress];
    
    YXBPendingDetailViewController *pendingDetailVC = [[YXBPendingDetailViewController alloc] init];
    [self.navigationController pushViewController:pendingDetailVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)showMBProgress:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //_hud.label.text= text;
    CGFloat centerY = self.view.center.y / 2;
    _hud.yOffset = -centerY;
    _hud.labelText = text;
    //_hud.backgroundColor = [UIColor grayColor];
}

- (void)dismissMBProgress{
    [_hud hide:YES afterDelay:2.0f];
    _hud = nil;
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
