//
//  YXBPendingDetailViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBPendingDetailViewController.h"
#import "YXBPendingDetailView.h"

@interface YXBPendingDetailViewController ()
/* 待完成view */
@property (nonatomic, strong) YXBPendingDetailView *pendingDetailView;

@end

@implementation YXBPendingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //
    [self setupUI];
}

- (void)setupUI{
    self.pendingDetailView = [[YXBPendingDetailView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.pendingDetailView];
}





























- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
