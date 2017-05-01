//
//  YXBGarageOrderDemandViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/25.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBGarageOrderDemandViewController.h"
#import "YXBOrderDemandView.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBGarageOrderDemandViewController ()<YXBOrderDemandViewDelegate>
//
@property (nonatomic, strong) YXBOrderDemandView *demandView;

@property (nonatomic, strong) MBProgressHUD * hud;
@end

@implementation YXBGarageOrderDemandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self initDemandView];
}

- (void)initDemandView{
    self.demandView = [[YXBOrderDemandView alloc] initWithFrame:self.view.bounds];
    self.demandView.remandViewDelegate = self;
    [self.demandView updataWithModel];
    [self.view addSubview:self.demandView];
}

#pragma mark - YXBOrderDemandViewDelegate
- (void)voiceBroadcastHandler{
    [self showMBProgress:@"暂时无法播放语音"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissMBProgress];
    });
}

- (void)callCustomerPhoneHandler{
    [self showMBProgress:@"暂时无法拨打电话"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissMBProgress];
    });
}

#pragma mark - 友情提示框
- (void)showMBProgress:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //_hud.label.text= text;
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
