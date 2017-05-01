//
//  YXBOrderViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBOrderViewController.h"
#import "YXBOrderTableViewCell.h"
#import "YXBGarageOrderDetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBOrderViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    MBProgressHUD *_hud;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

static NSString *YXBOrderViewControllerCellId = @"YXBOrderTableViewCellCellId";

@implementation YXBOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
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
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        //[self.view addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:@"YXBOrderTableViewCell" bundle:nil] forCellReuseIdentifier:YXBOrderViewControllerCellId];
        [self.view addSubview:_tableView];
        //
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
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

- (void)getDataHeaderRefresh{
    //weakify(self)
    if (_isLoading) {
        return;
    }
    _isLoading = YES;
    
    if (0 == self.dataSource.count) {
        [self showMBProgress:@"loading......"];
    }
    for (NSInteger i = 0; i < 10; i ++) {
        [self.dataSource addObject:@(i)];
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
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YXBOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YXBOrderViewControllerCellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YXBGarageOrderDetailViewController *orderDetailVC = [[YXBGarageOrderDetailViewController alloc] init];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100 * kViewHeightScale;
}

- (void)showMBProgress:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = text;
    _hud.removeFromSuperViewOnHide = YES;
    //设置hud背景色
    //_hud.color = [UIColor grayColor];
    //_hud.label.text= text;
    //_hud.backgroundColor = [UIColor grayColor];
}

- (void)dismissMBProgress{
    //[_hud hideAnimated:YES];
    [_hud hide:YES afterDelay:2.0f];
    _hud = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
