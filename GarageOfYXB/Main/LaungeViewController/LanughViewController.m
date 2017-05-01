//
//  LanughViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "LanughViewController.h"
#import "XXYSubViewsTool.h"
#import "XXYLoginViewController.h"
#import <Masonry/Masonry.h>

@interface LanughViewController ()
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation LanughViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setupSubviews];
    //
}
/**
 *  set backimage
 */
- (void)setupSubviews{
    
    UIImage *langchImage = [UIImage imageNamed:@"Lanuch_02"];
    self.imageView = [[UIImageView alloc] initWithImage:langchImage];
    self.imageView.frame = self.view.frame;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    //
    self.loginButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"马上进入" tintColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] target:self selAction:@selector(loginHandler)];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.loginButton.layer.borderWidth = 1;
    self.loginButton.layer.masksToBounds = YES;
    
    [self.imageView addSubview:self.loginButton];
    //
    weakify(self)
    CGFloat bottomMargin = XXYScreenH / 3;
    CGFloat width = XXYScreenW / 2;
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weak_self.imageView);
        make.bottom.mas_equalTo(weak_self.imageView.mas_bottom).with.offset(-bottomMargin);
        make.size.mas_equalTo(CGSizeMake(width, 30));
    }];
}
/**
 *  login mainVC
 */
- (void)loginHandler{
    XXYLoginViewController *loginVC = [[XXYLoginViewController alloc] init];
    UINavigationController *loginNVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.view.window.rootViewController = loginNVC;
    //self.navigationController.navigationBar.hidden = NO;
}

#pragma mark - 隐藏状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleDefault;
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
