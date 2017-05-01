//
//  YXBManagerOfLineViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBManagerOfLineViewController.h"
#import "YXBMBProgressHudTool.h"
#import "YXBManagerOfflineTableViewCell.h"
#import "YXBInputPriceAlertView.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBManagerOfLineViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    MBProgressHUD *_hud;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

static NSString *YXBManagerOfLineViewControllerCellID = @"YXBManagerOfflineTableViewCellId";

@implementation YXBManagerOfLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"线下订单管理";
    //[self.view addSubview:self.tableView];
    [self.tableView.mj_header beginRefreshing];
    [self setupRightItem];
}

- (void)setupRightItem{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"添加账单" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemAction)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)rightItemAction{
    self.navigationItem.rightBarButtonItem.enabled = NO;
    //隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    //self.navigationItem.leftBarButtonItem.enabled = NO;
    weakify(self)
    YXBInputPriceAlertView *alertView = [[YXBInputPriceAlertView alloc] init];
    [alertView showPriceAlertViewWithCompleteAction:^(NSString *projectNameStr, NSString *priceStr) {
        weak_self.navigationItem.rightBarButtonItem.enabled = YES;
        //显示状态栏
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        NSLog(@"%@  %@", projectNameStr, priceStr);
    } cancelBlock:^{
        weak_self.navigationItem.rightBarButtonItem.enabled = YES;
        //显示状态栏
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }];
}

/**
 *  懒加载tableview
 *
 *  @return <#return value description#>
 */
- (UITableView*)tableView{
    weakify(self)
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
        [_tableView registerNib:[UINib nibWithNibName:@"YXBManagerOfflineTableViewCell" bundle:nil] forCellReuseIdentifier:YXBManagerOfLineViewControllerCellID];
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
        //@"loading......"
        [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"loading......"];
    }
    
    for (NSInteger i = 0; i < 10; i ++) {
        
        if (XXYGetDataHeaderRefresh == _getDataType) {
            [self.tableView.mj_header endRefreshing];
        }else if (XXYGetDataFooterRefresh == _getDataType){
            [self.tableView.mj_footer endRefreshing];
        }
        
        if (XXYGetDataHeaderRefresh == _getDataType) {
            [self.dataSource removeAllObjects];
        }

        
        [self.dataSource addObject:@(i)];
        //NSLog(@"%zd", self.dataSource.count);
        [self.tableView reloadData];
    }
    _getDataType = XXYGetDataNormalRefresh;
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
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
    YXBManagerOfflineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YXBManagerOfLineViewControllerCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80 * kViewHeightScale;
}


- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
}
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation{
}
- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath{
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
