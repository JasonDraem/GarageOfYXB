//
//  XXYLoginViewController.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYLoginViewController.h"
#import "XXYLoginScrollView.h"
#import "XXYSubViewsTool.h"
#import <Masonry/Masonry.h>
#import "YXBTabbarViewController.h"

#import "YXBMBProgressHudTool.h"

#define kXXYLoginViewControllerNavigationViewHeight       64
#define kXXYLoginViewControllerSegmentControlHeight       44
#define kCRMLoginVCMaxDownTime                            61.0

@interface XXYLoginViewController ()<UIScrollViewDelegate, XXYAccountLoginScrollViewLoginDelegate, XXYVericationLoginScrollViewLoginDelegate>
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) XXYLoginScrollView *loginScrollView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIButton *vericationButton;
/* 倒计时时间 */
@property (nonatomic, assign) NSInteger countDownTime;
@property (nonatomic, strong) NSTimer *countDownTimer;

@end

@implementation XXYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    [self cancelNavigationBarColor];
    [self setupNavigationView];
//    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.loginScrollView];
//    self.navigationItem.titleView = self.segmentedControl;
//    
//    UINavigationBar *navigationBar = [UINavigationBar appearance];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
//    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
}
/**
 *  自定义导航栏
 */
- (void)setupNavigationView{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginScrollView];
    self.navigationController.navigationBarHidden = YES;
    self.navigationView = [[UIView alloc] init];
    //self.navigationView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.navigationView];
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //
    weakify(self)
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.view.mas_top);
        make.left.equalTo(weak_self.view.mas_left);
        make.right.equalTo(weak_self.view.mas_right);
        make.height.mas_equalTo(kXXYLoginViewControllerNavigationViewHeight);
    }];
    //
    [self.segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weak_self.navigationView.mas_bottom);
        make.left.equalTo(weak_self.navigationView.mas_left);
        make.right.equalTo(weak_self.navigationView.mas_right);
        make.height.mas_equalTo(kXXYLoginViewControllerSegmentControlHeight);
    }];
}
//懒加载创建登录相关滚动视图
- (XXYLoginScrollView *)loginScrollView{
    if (!_loginScrollView) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _loginScrollView = [[XXYLoginScrollView alloc] initWithFrame:CGRectMake(0, kXXYLoginViewControllerNavigationViewHeight, XXYScreenW, XXYScreenH)];
        _loginScrollView.delegate = self;
        //_loginScrollView.scrollEnabled = NO;
        //账户登录代理
        _loginScrollView.accountScrollViewLoginDelegate = self;
        //短信验证登录代理
        _loginScrollView.vericaitonScrollViewLoginDelegate = self;
    }
    return _loginScrollView;
}
//懒加载创建segmetcontrol
- (UISegmentedControl *)segmentedControl{
    
    if (!_segmentedControl) {
        NSArray *tittle = @[@"账号密码登录", @"手机验证登录"];
        _segmentedControl = [XXYSubViewsTool xxySegmentControlWithTitles:tittle];
        _segmentedControl.frame = CGRectMake(0, 0, XXYScreenW, 44);
        [self.navigationView addSubview:_segmentedControl];
        //点击事件
        [_segmentedControl addTarget:self action:@selector(segmentClickHandler:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}
#pragma mark - segmetedControl点击事件
- (void)segmentClickHandler:(UISegmentedControl *)seg{
    self.segmentedControl = seg;
    //self.loginScrollView.contentOffset = CGPointMake(self.segmentedControl.selectedSegmentIndex * XXYScreenW, 0);
    NSInteger index = seg.selectedSegmentIndex;
    CGRect frame = self.loginScrollView.frame;
    frame.origin.x = index * CGRectGetWidth(self.loginScrollView.frame);
    frame.origin.y = 0;
    [self.loginScrollView scrollRectToVisible:frame animated:YES];
    //
    if (0 == seg.selectedSegmentIndex) {
        [self.loginScrollView.scButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        // 关闭定时器
        [self cancleTimer];
    }else if (1 == seg.selectedSegmentIndex){
        //XXYLog(@"%ld", (long)seg.selectedSegmentIndex);
        self.loginScrollView.scButton.enabled = YES;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    //NSLog(@"------->:%f", offset);
    NSInteger ratio = round(offset / XXYScreenW);
    //self.segmentedControl.selectedSegmentIndex = offset / XXYScreenW;
    self.segmentedControl.selectedSegmentIndex = ratio;
    
    //解决 滑动视图 定时器问题
    if (0.0 == offset) {
        [self.loginScrollView.scButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        // 关闭定时器
        [self cancleTimer];
    }else{
        self.loginScrollView.scButton.enabled = YES;
    }
}

#pragma mark - XXYLoginScrollViewLoginDelegate
/**
 *  登录接口
 */
- (void)scrollViewLoginHandler{
    NSLog(@"login...");
    YXBTabbarViewController *yxbMainVC = [[YXBTabbarViewController alloc] init];
    self.view.window.rootViewController = yxbMainVC;
}
/**
 *  注册接口
 */
- (void)scrollViewRegisteredHandler{
    NSLog(@"registered...");
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"注册功能，待完善......"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}
/**
 *  找回密码接口
 */
- (void)scrollViewFindPasswordHandler{
    NSLog(@"findPassword...");
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"找回密码，待完善......"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}

#pragma mark - XXYVericationLoginScrollViewLoginDelegate
/**
 *  短信验证登录
 */
- (void)vericationLoginHandler:(NSString *)textField{
    NSLog(@"验证码为：%@", textField);
    XXYLogFunc;
    YXBTabbarViewController *yxbMainVC = [[YXBTabbarViewController alloc] init];
    self.view.window.rootViewController = yxbMainVC;
}
/**
 *  短信验证获取验证码
 */
- (void)vericationGetVericationCodeAction{
    XXYLogFunc;
    NSLog(@"%@", self.loginScrollView.scButton.titleLabel.text);
    //短信发送成功后启动定时器开始倒计时
    [self countDown:kCRMLoginVCMaxDownTime];
}
/**
 *  短信验证注册
 */
- (void)vericationRegisteredButtonHandler{
    XXYLogFunc;
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"注册待完善......"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}
/**
 *  短信验证找回密码
 */
- (void)vericationFindPasswordHandler{
    XXYLogFunc;
    [[YXBMBProgressHudTool shareInstance] showMBProgressShowAddedTo:self.view text:@"找回密码待完善......"];
    [[YXBMBProgressHudTool shareInstance] dismissMBProgress];
}

/**
 *  倒计时方法
 *
 *  @param seconds <#seconds description#>
 */
- (void)countDown:(float)seconds{
    
    if (!self.countDownTimer) {
        self.countDownTime = seconds;
        self.loginScrollView.scButton.enabled = NO;
        self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeSeconds) userInfo:nil repeats:YES];
        [self.countDownTimer fire];
    }
}
/**
 *  记录倒计时当前秒数
 */
- (void)changeSeconds{
    // 记录的秒数-1
    self.countDownTime --;
    // 设置按钮的标题为当前剩余秒数
    //self.loginScrollView.scButton.userInteractionEnabled = NO;
    [self.loginScrollView.scButton setTitle:[NSString stringWithFormat:@"%zd秒 后重新获取" ,self.countDownTime] forState:UIControlStateNormal];
    XXYLog(@"%zd", self.countDownTime);
    // 判断倒计时小余等于0的时候
    if (self.countDownTime <= 0) {
        // 标题恢复
        [self.loginScrollView.scButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        //[self.countDownTimer setFireDate:[NSDate distantFuture]];
        // 按钮开启,可以交互点击
        self.loginScrollView.scButton.enabled = YES;
        // 停止定时器
        [self cancleTimer];
    }
}
/**
 *  取消计时器
 */
- (void)cancleTimer{
    if (self.countDownTimer.isValid) {
        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
    }
}
/**
 *  取消导航栏下划线
 */
- (void)cancelNavigationBarColor {
    // 最简单的方法   消除navigationBar 下方边线
    self.navigationController.navigationBar.clipsToBounds=YES;
    //    消除navigationBar 下方边线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    CGRect frame = self.navigationController.navigationBar.frame;
    
    CALayer *bottomLayer = [CALayer layer];
    frame.size = CGSizeMake(XXYScreenW, 1);
    frame.origin = CGPointMake(0, 44);
    bottomLayer.frame = frame;
    // --- tabbar边线颜色
    //#E6E6E6  #aaaaaa
#define BorderColor @"#E6E6E6"
    
    bottomLayer.backgroundColor = [[UIColor colorWithHexString:BorderColor] CGColor];
    
    [self.navigationController.navigationBar.layer addSublayer:bottomLayer];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
