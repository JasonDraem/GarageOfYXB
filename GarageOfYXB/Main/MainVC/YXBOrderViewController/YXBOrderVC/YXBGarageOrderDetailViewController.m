//
//  YXBGarageOrderDetailViewController.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/25.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBGarageOrderDetailViewController.h"

#import "YXBGarageOrderDemandViewController.h"
#import "YXBGarageOrderMaintenancePlanViewController.h"

#import <Masonry/Masonry.h>

@interface YXBGarageOrderDetailViewController ()<UIScrollViewDelegate>

/* 维修需求controller */
@property (nonatomic, strong) YXBGarageOrderDemandViewController * demanViewController;
/* 维修方案controller */
@property (nonatomic, strong) YXBGarageOrderMaintenancePlanViewController *maintenancePlanViewController;
/* 需求滚动视图 */
@property (nonatomic, strong) UIScrollView *orderDetailScrollView;
/*  */
@property (nonatomic, strong) UISegmentedControl *headerSegment;

@end

@implementation YXBGarageOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self initHeaderSegment];
    [self initOrderDetailScrollView];
}
//初始化滚动视图
- (void)initOrderDetailScrollView{
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    _orderDetailScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40*kViewHeightScale, XXYScreenW, XXYScreenH - 104 * kViewHeightScale)];
    _orderDetailScrollView.delegate = self;
    _orderDetailScrollView.backgroundColor = [UIColor redColor];
    _orderDetailScrollView.bounces = NO;
    _orderDetailScrollView.pagingEnabled = YES;
    _orderDetailScrollView.directionalLockEnabled = YES;
    _orderDetailScrollView.showsVerticalScrollIndicator = NO;
    _orderDetailScrollView.contentSize = CGSizeMake(XXYScreenW*2, XXYScreenH);
    [self.view addSubview:_orderDetailScrollView];
    //
    [self addChildControllerHandler];
}
//
- (void)initHeaderSegment{
    _headerSegment = [[UISegmentedControl alloc] initWithItems:@[@"维修需求", @"维修方案"]];
    _headerSegment.selectedSegmentIndex = 0;
    //设置着色(字体、边框、选中)
    _headerSegment.tintColor = [UIColor grayColor];
    //设置操作是否是暂时的
    //_headerSegment.momentary = YES;
    //设置标题属性
    [_headerSegment setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    //
    [_headerSegment setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    
    [_headerSegment addTarget:self action:@selector(clickHandle:) forControlEvents:UIControlEventValueChanged];
    [_headerSegment setBackgroundColor:[UIColor lightGrayColor]];
    //设置宽度，没有设置的段平均分
    //[_headerSegment setWidth:65 forSegmentAtIndex:1];
    
    [self.view addSubview:_headerSegment];
    //
    weakify(self)
    [_headerSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.view.mas_top);
        make.left.equalTo(weak_self.view.mas_left);
        make.right.equalTo(weak_self.view.mas_right);
        make.height.mas_equalTo(40 * kViewHeightScale);
    }];
}
//添加子视图
- (void)addChildControllerHandler{
    self.demanViewController = [[YXBGarageOrderDemandViewController alloc] init];
    
    self.maintenancePlanViewController = [[YXBGarageOrderMaintenancePlanViewController alloc] init];
    //
    [self addChildViewController:self.demanViewController];
    [self addChildViewController:self.maintenancePlanViewController];
    
    //
    [self.orderDetailScrollView addSubview:self.demanViewController.view];
    [self.orderDetailScrollView addSubview:self.maintenancePlanViewController.view];
    //设置位置
    CGRect responderRect = self.maintenancePlanViewController.view.frame;
    responderRect.origin.x = XXYScreenW;
    responderRect.size.height = CGRectGetHeight(self.orderDetailScrollView.frame);
    self.maintenancePlanViewController.view.frame = responderRect;
}

#pragma mark - Scrollview delegate
//
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / XXYScreenW);
    self.headerSegment.selectedSegmentIndex = ratio;
}

//
- (void)clickHandle:(UISegmentedControl *)sc{
    
    NSInteger index = sc.selectedSegmentIndex;
    CGRect frame = self.orderDetailScrollView.frame;
    frame.origin.x = index * CGRectGetWidth(self.orderDetailScrollView.frame);
    frame.origin.y = 0;
    [self.orderDetailScrollView scrollRectToVisible:frame animated:YES];
}












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
