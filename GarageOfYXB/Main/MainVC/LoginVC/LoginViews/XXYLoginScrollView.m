//
//  XXYLoginScrollView.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYLoginScrollView.h"
#import "XXYAccountLoginView.h"
#import "XXYVerificationLoginView.h"

#define kXXYLoginScrollViewTopSpace         64



@interface XXYLoginScrollView ()<XXYAccountLoginViewLoginDelegate, XXYVerificationLoginDelegate>

@end

@implementation XXYLoginScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self setUpSubviews];
    }
    return self;
}
/**
 *  设置scrolview基本属性
 */
- (void)setupUI{
    self.bounces = NO;
    self.pagingEnabled = YES;
    self.directionalLockEnabled = YES;
    
    self.contentInset = UIEdgeInsetsMake(-kXXYLoginScrollViewTopSpace, 0, 0, 0);
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.contentSize = CGSizeMake(2 * XXYScreenW, XXYScreenH);
}
/**
 *  添加子视图
 */
- (void)setUpSubviews{
    XXYAccountLoginView *accountView = [[XXYAccountLoginView alloc] initWithFrame:CGRectMake(0, 0, XXYScreenW, XXYScreenH)];
    accountView.loginDelegate = self;
    [self addSubview:accountView];
    
    XXYVerificationLoginView *verificationLoginView = [[XXYVerificationLoginView alloc] initWithFrame:CGRectMake(XXYScreenW, 0, XXYScreenW, XXYScreenH)];
    self.scButton = verificationLoginView.getCodeBT;
    
    verificationLoginView.verificatonLoginDelgate = self;
    [self addSubview:verificationLoginView];
    //
    CGRect responderRect = verificationLoginView.frame;
    responderRect.origin.x = XXYScreenW;
    responderRect.size.height = CGRectGetHeight(self.frame);
    verificationLoginView.frame = responderRect;
}
#pragma mark - XXYAccountLoginViewLoginDelegate
/**
 *  登录
 */
- (void)loginAccount{
    if (self.accountScrollViewLoginDelegate && [self.accountScrollViewLoginDelegate respondsToSelector:@selector(scrollViewLoginHandler)]) {
        [self.accountScrollViewLoginDelegate scrollViewLoginHandler];
    }
}
/**
 *  注册
 */
- (void)registeredAccount{
    if (self.accountScrollViewLoginDelegate && [self.accountScrollViewLoginDelegate respondsToSelector:@selector(scrollViewRegisteredHandler)]) {
        [self.accountScrollViewLoginDelegate scrollViewRegisteredHandler];
    }
}
/**
 *  找回密码
 */
- (void)findPassword{
    if (self.accountScrollViewLoginDelegate && [self.accountScrollViewLoginDelegate respondsToSelector:@selector(scrollViewFindPasswordHandler)]) {
        [self.accountScrollViewLoginDelegate scrollViewFindPasswordHandler];
    }
}
#pragma mark - XXYVerificationLoginDelegate
/**
 *  登录
 */
- (void)verificationLoginButtonHandler:(NSString *)verificationText{
    if (self.vericaitonScrollViewLoginDelegate && [self.vericaitonScrollViewLoginDelegate respondsToSelector:@selector(vericationLoginHandler:)]) {
        [self.vericaitonScrollViewLoginDelegate vericationLoginHandler:verificationText];
    }
}

/**
 *  获取验证码
 */
- (void)verificaitonGetVerificationCodeHandler{
    if (self.vericaitonScrollViewLoginDelegate && [self.vericaitonScrollViewLoginDelegate respondsToSelector:@selector(vericationGetVericationCodeAction)]) {
        [self.vericaitonScrollViewLoginDelegate vericationGetVericationCodeAction];
    }
}

/**
 *  注册
 */
- (void)verificaitonRegristeredHandler{
    if (self.vericaitonScrollViewLoginDelegate && [self.vericaitonScrollViewLoginDelegate respondsToSelector:@selector(vericationRegisteredButtonHandler)]) {
        [self.vericaitonScrollViewLoginDelegate vericationRegisteredButtonHandler];
    }
}

/**
 *  忘记密码
 */
- (void)verificaitonFogotPasswordHandler{
    if (self.vericaitonScrollViewLoginDelegate && [self.vericaitonScrollViewLoginDelegate respondsToSelector:@selector(vericationFindPasswordHandler)]) {
        [self.vericaitonScrollViewLoginDelegate vericationFindPasswordHandler];
    }
}
@end

