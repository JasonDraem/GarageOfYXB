//
//  XXYAccountLoginView.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYAccountLoginView.h"
#import "XXYSubViewsTool.h"
#import <Masonry/Masonry.h>
#import "XXYKeyBoardManager.h"
/* 登录按钮背景色 */
#define kXXYAccountLoginViewLoginButtonColor    XXYColor(35, 205, 253, 1.0)

/* 距上距离 */
#define kXXYAccountLoginViewTopMargin           90
/* 左距离 */
#define kXXYAccountLoginViewLeftMargin          10
/* 用户输入框左间距 */
#define kXXYAccountLoginViewAccountTFLeft       20
/* 用户输入框右间距 */
#define kXXYAccountLoginViewAccountTFRight      30
/* 分界线top */
#define kXXYAccountLoginViewAccountAccountLineViewTop      10

@interface NSLayoutXAxisAnchor ()<XXYKeyboardControllerDelegate>

@property (nonatomic, strong) XXYKeyBoardManager *keyboardManager;

@end
@implementation XXYAccountLoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self accountSetupSubViews];
    }
    return self;
}
/**
 *  初始化UI控件
 */
- (void)accountSetupSubViews{
    //account imageview
    UIImage *accountImage = GetImage(@"account");
    CGFloat imageWidth = accountImage.size.width;
    CGFloat imageHeight = accountImage.size.height;
    self.accountImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:accountImage];
    [self addSubview:self.accountImageView];
    
    //password imageview
    UIImage *passwordImage = GetImage(@"password");
    self.passwordImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:passwordImage];
    [self addSubview:self.passwordImageView];
    
    //account tf
    self.accountTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"请输入汽修厂APP商家账户" tag:1000];
    [self addSubview:self.accountTF];
    
    //password tf
    self.passwordTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"请输入密码" tag:1001];
    [self addSubview:self.passwordTF];
    
    //login button
    self.loginBT = [XXYSubViewsTool xxyLoginButtonWithTitle:@"登录" tintColor:[UIColor xxy_blackColor] backgroundColor:kXXYAccountLoginViewLoginButtonColor target:self selAction:@selector(loginButtonHandler)];
    [self addSubview:self.loginBT];
    
    //registered button
    self.registeredBT = [XXYSubViewsTool xxyLoginButtonWithTitle:@"注册账号，立即入驻" tintColor:kXXYAccountLoginViewLoginButtonColor backgroundColor:[UIColor clearColor] target:self selAction:@selector(registeredButtonHandler)];
    self.registeredBT.titleLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.registeredBT];
    
    //fogot button
    self.fogotPWBT = [XXYSubViewsTool xxyLoginButtonWithTitle:@"找回密码" tintColor:kXXYAccountLoginViewLoginButtonColor backgroundColor:[UIColor clearColor] target:self selAction:@selector(fogotButtonHandler)];
    self.fogotPWBT.titleLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.fogotPWBT];
    
    //account line
    self.accountLineView = [XXYSubViewsTool xxyLoginLineTool];
    [self addSubview:self.accountLineView];
    
    //passwod line
    self.passwordLineView = [XXYSubViewsTool xxyLoginLineTool];
    [self addSubview:self.passwordLineView];
    
    //
    [self accountLayoutsubviewsWithWidth:imageWidth height:imageHeight];
}
/**
 *  登录
 */
- (void)loginButtonHandler{
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(loginAccount)]) {
        [self.loginDelegate loginAccount];
    }
}
/**
 *  注册
 */
- (void)registeredButtonHandler{
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(registeredAccount)]) {
        [self.loginDelegate registeredAccount];
    }
}
/**
 *  找回密码
 */
- (void)fogotButtonHandler{
    if (self.loginDelegate && [self.loginDelegate respondsToSelector:@selector(findPassword)]) {
        [self.loginDelegate findPassword];
    }
}
/**
 *  布局
 *
 *  @param width  图片宽
 *  @param height 图片高
 */
- (void)accountLayoutsubviewsWithWidth:(CGFloat)width height:(CGFloat)height{
    weakify(self)
    [self.accountImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.mas_top).with.offset(kXXYAccountLoginViewTopMargin);
        make.left.mas_equalTo(weak_self.mas_left).with.offset(kXXYAccountLoginViewLeftMargin);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];
    //
    //self.accountTF.backgroundColor = [UIColor greenColor];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.mas_top).with.offset(86);
        make.left.equalTo(weak_self.accountImageView.mas_right).with.offset(kXXYAccountLoginViewAccountTFLeft);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(-kXXYAccountLoginViewAccountTFRight);
        make.height.mas_equalTo(2 * height);
    }];
    //
    [self.accountLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.accountTF.mas_bottom).with.offset(kXXYAccountLoginViewAccountAccountLineViewTop);
        make.left.equalTo(weak_self.mas_left);
        make.right.mas_equalTo(weak_self.mas_right);
        make.height.mas_equalTo(.5f);
    }];
    //
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.accountLineView.mas_bottom).with.offset(15);
        make.left.equalTo(weak_self.accountImageView.mas_left);
        make.size.equalTo(weak_self.accountImageView);
    }];
    //
    //self.passwordTF.backgroundColor = [UIColor redColor];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.accountLineView.mas_bottom).with.offset(10);
        make.left.equalTo(weak_self.accountTF.mas_left);
        make.right.equalTo(weak_self.accountTF.mas_right);
        make.height.equalTo(weak_self.accountTF);
    }];
    //
    [self.passwordLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.passwordTF.mas_bottom).with.offset(kXXYAccountLoginViewAccountAccountLineViewTop);
        make.left.equalTo(weak_self.accountLineView.mas_left);
        make.right.equalTo(weak_self.accountLineView.mas_right);
        make.height.equalTo(weak_self.accountLineView);
    }];
    //
    [self.loginBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.passwordLineView.mas_bottom).with.offset(30*kViewHeightScale);
        make.left.mas_equalTo(weak_self.mas_left).with.offset(50*kViewWidthScale);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(-50*kViewWidthScale);
        make.height.mas_equalTo(40*kViewHeightScale);
    }];
    //
    [self.registeredBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.loginBT.mas_bottom).with.offset(10);
        make.left.mas_equalTo(weak_self.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
    //
    [self.fogotPWBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.registeredBT.mas_top);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(-10);
        make.size.mas_equalTo(weak_self.registeredBT);
    }];
}
#pragma mark - 移除第一响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.accountTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}
#pragma mark - 判断手机号是否合法
//手机号码的正则表达式
- (BOOL)isValidateMobile:(NSString *)mobile{
    //手机号以13、15、18开头，八个\d数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}











@end
