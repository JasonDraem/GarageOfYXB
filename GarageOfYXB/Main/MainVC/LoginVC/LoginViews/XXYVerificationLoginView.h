//
//  XXYVerificationLoginView.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  验证码登录代理
 */
@protocol XXYVerificationLoginDelegate <NSObject>
/**
 *  登录
 */
- (void)verificationLoginButtonHandler:(NSString *)verificationTF;
/**
 *  注册
 */
- (void)verificaitonRegristeredHandler;
/**
 *  忘记密码
 */
- (void)verificaitonFogotPasswordHandler;
/**
 *  获取验证码
 */
- (void)verificaitonGetVerificationCodeHandler;

@end

@interface XXYVerificationLoginView : UIView
/* 手机图标 */
@property (nonatomic, strong) UIImageView *phoneImageView;
/* 短信图标 */
@property (nonatomic, strong) UIImageView *messageImageView;

/* 用户输入框 */
@property (nonatomic, strong) UITextField *phoneTF;
/* 密码输入框 */
@property (nonatomic, strong) UITextField *messageTF;

/* 登录按钮 */
@property (nonatomic, strong) UIButton *loginBT;
/* 注册按钮 */
@property (nonatomic, strong) UIButton *registeredBT;
/* 忘记密码 */
@property (nonatomic, strong) UIButton *fogotPWBT;
/* 获取验证码 */
@property (nonatomic, strong) UIButton *getCodeBT;

/* 账户分界线 */
@property (nonatomic, strong) UIView *phoneLineView;
/* 密码分界线 */
@property (nonatomic, strong) UIView *messageLineView;

@property (nonatomic, weak) id<XXYVerificationLoginDelegate>verificatonLoginDelgate;

@end
