//
//  YXBFinishedViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBFinishedViewController.h"
#import "YXBManagerFinishedTableViewCell.h"
#import "YXBManagerFinishedDetailViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBFinishedViewController ()<UITableViewDelegate, UITableViewDataSource, YXBManagerFinishedTableViewCellDelegate>
{
    MBProgressHUD *_hud;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;


@end

static NSString *YXBFinishedViewControllerId  = @"YXBManagerFinishedTableViewCellId";

@implementation YXBFinishedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView.mj_header beginRefreshing];
    //
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
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        [_tableView registerNib:[UINib nibWithNibName:@"YXBManagerFinishedTableViewCell" bundle:nil] forCellReuseIdentifier:YXBFinishedViewControllerId];
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
    YXBManagerFinishedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YXBFinishedViewControllerId];
    //设置代理
    cell.finishedCellDelegate = self;
    
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

#pragma mark - YXBManagerFinishedTableViewCellDelegate
- (void)clickFinishedButtonHandler{
    YXBManagerFinishedDetailViewController *detailVC = [[YXBManagerFinishedDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //
    //self.tabBarController.tabBar.hidden = NO;
}

- (void)showMBProgress:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //_hud.label.text= text;
    _hud.labelText = text;
    //_hud.backgroundColor = [UIColor grayColor];
}

- (void)dismissMBProgress{
    //[_hud hideAnimated:YES afterDelay:2.0f];
    [_hud hide:YES afterDelay:2.0f];
    _hud = nil;
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
