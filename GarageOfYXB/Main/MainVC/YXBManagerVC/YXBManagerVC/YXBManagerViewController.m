//
//  YXBManagerViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBManagerViewController.h"
#import "YXBMaintenanceViewController.h"
#import "YXBManagerOfLineViewController.h"
#import "XXYSubViewsTool.h"
#import <Masonry/Masonry.h>

@interface YXBManagerViewController ()
/* 查看进度 */
@property (nonatomic, strong) UIButton *progressButton;
/* 线下管理 */
@property (nonatomic, strong) UIButton *managerButton;

@end

@implementation YXBManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self layoutSubviewsHandler];
}

- (UIButton *)progressButton{
    if (!_progressButton) {
        _progressButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"查看维修进度" tintColor:[UIColor blackColor] backgroundColor:[UIColor brownColor] target:self selAction:@selector(progressButtonAction)];
        [self.view addSubview:_progressButton];
    }
    return _progressButton;
}

- (UIButton *)managerButton{
    if (!_managerButton) {
        _managerButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"线下管理 " tintColor:[UIColor blackColor] backgroundColor:[UIColor orangeColor] target:self selAction:@selector(managerButtonAction)];
        [self.view addSubview:_managerButton];
    }
    return _managerButton;
}

- (void)progressButtonAction{
    self.hidesBottomBarWhenPushed = YES;
    YXBMaintenanceViewController *maintenanceVC = [[YXBMaintenanceViewController alloc] init];
    [self.navigationController pushViewController:maintenanceVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)managerButtonAction{
    self.hidesBottomBarWhenPushed = YES;
    YXBManagerOfLineViewController *managerVC = [[YXBManagerOfLineViewController alloc] init];
    [self.navigationController pushViewController:managerVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void)layoutSubviewsHandler{
    weakify(self)
    [self.progressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weak_self.view.mas_centerX);
        make.top.mas_equalTo(weak_self.view.mas_top).with.offset(200 * kViewHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kViewWidthScale, 30*kViewHeightScale));
    }];
    //
    [self.managerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weak_self.view.mas_centerX);
        make.top.mas_equalTo(weak_self.progressButton.mas_bottom).with.offset(50 * kViewHeightScale);
        make.size.mas_equalTo(CGSizeMake(100*kViewWidthScale, 30*kViewHeightScale));
    }];
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
