//
//  XXYAccountLoginView.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XXYAccountLoginViewLoginDelegate <NSObject>

- (void)loginAccount;

- (void)registeredAccount;

- (void)findPassword;

@end

@interface XXYAccountLoginView : UIView
/* 用户图标 */
@property (nonatomic, strong) UIImageView *accountImageView;
/* 密码图标 */
@property (nonatomic, strong) UIImageView *passwordImageView;

/* 用户输入框 */
@property (nonatomic, strong) UITextField *accountTF;
/* 密码输入框 */
@property (nonatomic, strong) UITextField *passwordTF;

/* 登录按钮 */
@property (nonatomic, strong) UIButton *loginBT;
/* 注册按钮 */
@property (nonatomic, strong) UIButton *registeredBT;
/* 忘记密码 */
@property (nonatomic, strong) UIButton *fogotPWBT;

/* 账户分界线 */
@property (nonatomic, strong) UIView *accountLineView;
/* 密码分界线 */
@property (nonatomic, strong) UIView *passwordLineView;

@property (nonatomic, weak) id<XXYAccountLoginViewLoginDelegate>loginDelegate;

@end
