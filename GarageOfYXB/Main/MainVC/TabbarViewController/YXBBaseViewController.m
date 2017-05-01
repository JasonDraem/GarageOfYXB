//
//  YXBBaseViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBBaseViewController.h"

@interface YXBBaseViewController ()

@end

@implementation YXBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    //[self setupUI];
    _currentPage = 0;
    //
    _getDataType = XXYGetDataNormalRefresh;
    //
    _isLoading = NO;
    //
    [self setupUI];
}

/**
 *  请求数据
 */
- (void)GetDataFromsever{}
#pragma mark - 刷新和加载 -
- (void)changeStatesText:(MJRefreshNormalHeader *)header{
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"即将进入刷新状态" forState:MJRefreshStateWillRefresh];
    [header setTitle:@"正在刷新..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"刷新完毕" forState:MJRefreshStateNoMoreData];
    //更改状态颜色
    header.stateLabel.textColor = [UIColor grayColor];
    //更改显示时间颜色
    header.lastUpdatedTimeLabel.textColor = [UIColor grayColor];
}
/**
 *  下拉刷新
 */
- (void)getDataHeaderRefresh{
    _getDataType = XXYGetDataHeaderRefresh;
    [self GetDataFromsever];
}
/*
 *  上拉加载
 */
- (void)getDataFooterRefresh{
    _getDataType = XXYGetDataFooterRefresh;
    [self GetDataFromsever];
}
#pragma mark - 导航栏基本设置
- (void)setupUI{
    /* 1.设置导航栏颜色 */
    //UINavigationBar *navigationBar = [UINavigationBar appearance];
    //[navigationBar setBarTintColor:XXYColor(59.0, 69.0, 98.0, 1.0)];
    //
    /* 2.设置导航条颜色 */
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navitationbar"] forBarMetrics:UIBarMetricsDefault];
    //self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    /* 3.改变导航栏返回按钮颜色*/
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    /* 4.设置导航条标题字体颜色以及大小*/
    //[navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


#pragma mark - 隐藏状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}
//
- (BOOL)prefersStatusBarHidden {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    return YES;
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
