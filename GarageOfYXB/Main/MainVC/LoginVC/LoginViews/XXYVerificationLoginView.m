//
//  XXYVerificationLoginView.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYVerificationLoginView.h"
#import "XXYSubViewsTool.h"
#import <Masonry/Masonry.h>

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

@implementation XXYVerificationLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self verificationSetupSubViews];
    }
    return self;
}

/**
 *  初始化UI控件
 */
- (void)verificationSetupSubViews{
    //account imageview
    UIImage *accountImage = GetImage(@"phone");
    CGFloat imageWidth = accountImage.size.width;
    CGFloat imageHeight = accountImage.size.height;
    self.phoneImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:accountImage];
    [self addSubview:self.phoneImageView];
    
    //password imageview
    UIImage *passwordImage = GetImage(@"message");
    self.messageImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:passwordImage];
    [self addSubview:self.messageImageView];
    
    //phone tf
    self.phoneTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"请输入手机号" tag:1002];
    [self addSubview:self.phoneTF];
    
    //getCode button
    self.getCodeBT = [XXYSubViewsTool xxyLoginButtonWithTitle:@"获取验证码" tintColor:kXXYAccountLoginViewLoginButtonColor backgroundColor:[UIColor xxy_clearColor] target:self selAction:@selector(getVerificationHandler)];
    self.getCodeBT.layer.borderColor = [kXXYAccountLoginViewLoginButtonColor CGColor];
    self.getCodeBT.layer.borderWidth = .5f;
    [self addSubview:self.getCodeBT];
    
    //message tf
    self.messageTF = [XXYSubViewsTool xxyLoginTextFieldToolWithPlaceholder:@"请输入短信验证码" tag:1003];
    [self addSubview:self.messageTF];
    
    //login button
    self.loginBT = [XXYSubViewsTool xxyLoginButtonWithTitle:@"登录" tintColor:[UIColor xxy_blackColor] backgroundColor:kXXYAccountLoginViewLoginButtonColor target:self selAction:@selector(loginButtonHandler:)];
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
    self.phoneLineView = [XXYSubViewsTool xxyLoginLineTool];
    [self addSubview:self.phoneLineView];
    
    //passwod line
    self.messageLineView = [XXYSubViewsTool xxyLoginLineTool];
    [self addSubview:self.messageLineView];
    //
    [self accountLayoutsubviewsWithWidth:imageWidth height:imageHeight];
}
/**
 *  登录
 */
- (void)loginButtonHandler:(NSString *)code{
    if (self.verificatonLoginDelgate && [self.verificatonLoginDelgate respondsToSelector:@selector(verificationLoginButtonHandler:)]) {
        code = self.messageTF.text;
        [self.verificatonLoginDelgate verificationLoginButtonHandler:code];
    }
}
/**
 *  注册
 */
- (void)registeredButtonHandler{
    if (self.verificatonLoginDelgate && [self.verificatonLoginDelgate respondsToSelector:@selector(verificaitonRegristeredHandler)]) {
        [self.verificatonLoginDelgate verificaitonRegristeredHandler];
    }
}
/**
 *  忘记密码
 */
- (void)fogotButtonHandler{
    if (self.verificatonLoginDelgate && [self.verificatonLoginDelgate respondsToSelector:@selector(verificaitonFogotPasswordHandler)]) {
        [self.verificatonLoginDelgate verificaitonFogotPasswordHandler];
    }
}
/**
 *  获取验证码
 */
- (void)getVerificationHandler{
    if (self.verificatonLoginDelgate && [self.verificatonLoginDelgate respondsToSelector:@selector(verificaitonGetVerificationCodeHandler)]) {
        
        [self.verificatonLoginDelgate verificaitonGetVerificationCodeHandler];
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
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.mas_top).with.offset(kXXYAccountLoginViewTopMargin);
        make.left.mas_equalTo(weak_self.mas_left).with.offset(kXXYAccountLoginViewLeftMargin);
        make.size.mas_equalTo(CGSizeMake(width, height));
    }];
    //getCode button
    //self.getCodeBT.backgroundColor = [UIColor brownColor];
    [self.getCodeBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.mas_top).with.offset(86);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(-kXXYAccountLoginViewAccountTFLeft);
        make.size.mas_equalTo(CGSizeMake(100*kViewWidthScale, 2*height*kViewHeightScale));
    }];
    //self.phoneTF.backgroundColor = [UIColor greenColor];
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.mas_top).with.offset(86);
        make.left.equalTo(weak_self.phoneImageView.mas_right).with.offset(kXXYAccountLoginViewAccountTFLeft);
        make.right.mas_equalTo(weak_self.getCodeBT.mas_left).with.offset(-kXXYAccountLoginViewAccountTFLeft);
        make.height.mas_equalTo(2 * height);
    }];
    //
    [self.phoneLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.phoneTF.mas_bottom).with.offset(kXXYAccountLoginViewAccountAccountLineViewTop);
        make.left.equalTo(weak_self.mas_left);
        make.right.mas_equalTo(weak_self.mas_right);
        make.height.mas_equalTo(1.0f);
    }];
    //
    [self.messageImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.phoneLineView.mas_bottom).with.offset(15);
        make.left.equalTo(weak_self.phoneImageView.mas_left);
        make.size.equalTo(weak_self.phoneImageView);
    }];
    //
    //self.messageTF.backgroundColor = [UIColor redColor];
    [self.messageTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.phoneLineView.mas_bottom).with.offset(10);
        make.left.equalTo(weak_self.phoneTF.mas_left);
        make.right.equalTo(weak_self.phoneTF.mas_right);
        make.height.equalTo(weak_self.phoneTF);
    }];
    //
    [self.messageLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.messageTF.mas_bottom).with.offset(kXXYAccountLoginViewAccountAccountLineViewTop);
        make.left.equalTo(weak_self.phoneLineView.mas_left);
        make.right.equalTo(weak_self.phoneLineView.mas_right);
        make.height.equalTo(weak_self.phoneLineView);
    }];
    //
    [self.loginBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.messageLineView.mas_bottom).with.offset(30*kViewHeightScale);
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
//放弃第一响应
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.phoneTF endEditing:YES];
    [self.messageTF endEditing:YES];
}


@end
