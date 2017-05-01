//
//  XXYLoginScrollView.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XXYAccountLoginScrollViewLoginDelegate <NSObject>
/**
 *  账户登录
 */
- (void)scrollViewLoginHandler;
/**
 *  账户登录注册
 */
- (void)scrollViewRegisteredHandler;
/**
 *  账户登录找回密码
 */
- (void)scrollViewFindPasswordHandler;

@end

@protocol XXYVericationLoginScrollViewLoginDelegate <NSObject>
/**
 *  短信登录
 */
- (void)vericationLoginHandler:(NSString *)textField;
/**
 *  短信登录注册
 */
- (void)vericationRegisteredButtonHandler;
/**
 *  短信登录获取验证码
 */
- (void)vericationGetVericationCodeAction;
/**
 *  短信登录找回密码
 */
- (void)vericationFindPasswordHandler;

@end

@interface XXYLoginScrollView : UIScrollView
@property (nonatomic, strong) UIButton *scButton;
/**
 *  账号密码登录代理
 */
@property (nonatomic, weak) id<XXYAccountLoginScrollViewLoginDelegate>accountScrollViewLoginDelegate;
/**
 *  短信验证码登录
 */
@property (nonatomic, weak) id<XXYVericationLoginScrollViewLoginDelegate>vericaitonScrollViewLoginDelegate;
@end
