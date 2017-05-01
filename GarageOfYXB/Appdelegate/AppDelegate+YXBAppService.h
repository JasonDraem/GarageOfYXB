//
//  AppDelegate+YXBAppService.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/12.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
//#import <AdSupport/AdSupport.h>
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

static NSString *channel = @"Publish channel";
static BOOL isProduction = FALSE;

@interface AppDelegate (YXBAppService)

/**
 *  基本配置
 */
- (void)configurationLaunchUserOption;

/**
 *  友盟注册
 */
- (void)registerUMeng;

/**
 *  极光推送注册和配置
 *  @param launchOptions options
 */
- (void)registerJPushAndConfigurationLaunchUserOptionWithOptions:(NSDictionary *)launchOptions delegate:(id<JPUSHRegisterDelegate>)delegate;

/**
 *  Mob注册 短信验证
 */
- (void)registerMob;

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption;

/**
 *  上传用户设备信息
 */
- (void)upLoadMessageAboutUser;

@end
