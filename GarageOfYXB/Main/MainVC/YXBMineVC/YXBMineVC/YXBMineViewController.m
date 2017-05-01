//
//  YXBMineViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBMineViewController.h"
#import "UIScrollView+ScalableCover.h"
#import "YXBGarageHeaderView.h"
#import "YXBGarageMineTableViewCell.h"
#import <MBProgressHUD/MBProgressHUD.h>


@interface YXBMineViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    MBProgressHUD *_hud;
}
//
@property (nonatomic, strong) UITableView *tableView;
//
@property (nonatomic, strong) NSMutableArray *dataSource;
//
@property (nonatomic, strong) YXBGarageHeaderView *headerView;
//

@end

static NSString *YXBMineViewControllerCellId = @"YXBGarageMineTableViewCell";

@implementation YXBMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableViewHeadeView];
}
/**
 *  懒加载tableview
 *
 *  @return <#return value description#>
 */
- (UITableView*)tableView{
    //self.automaticallyAdjustsScrollViewInsets = NO;
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //_tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //注册cell
        [_tableView registerNib:[UINib nibWithNibName:@"YXBGarageMineTableViewCell" bundle:nil] forCellReuseIdentifier:YXBMineViewControllerCellId];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
//设置头视图
- (void)setTableViewHeadeView{
    self.headerView = [[YXBGarageHeaderView alloc] initWithFrame:CGRectMake(0, 0, XXYScreenW, 200 * kViewHeightScale)];
    self.tableView.tableHeaderView = self.headerView;
    //[self.headerView.startsView setLeveal:3.5f];
    [self.headerView.startsView setStartProgress:(double)2.5];
}
/**
 *  懒加载datasource
 *
 *  @return <#return value description#>
 */
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithObjects:@"装修汽修厂主页", @"认证你的职位", @"设置", @"优惠", nil];
    }
    return _dataSource;
}


#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YXBGarageMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YXBMineViewControllerCellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.garageMineCellLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showMBProgress:@"研发中..."];
    [self dismissMBProgress];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60 * kViewHeightScale;
}

#pragma mark - 


- (void)showMBProgress:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.labelText = text;
    //_hud.label.text= text;
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
