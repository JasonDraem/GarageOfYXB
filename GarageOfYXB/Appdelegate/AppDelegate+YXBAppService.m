//
//  AppDelegate+YXBAppService.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/12.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "AppDelegate+YXBAppService.h"
#import "LanughViewController.h"
#import "XXYLoginViewController.h"


@implementation AppDelegate (YXBAppService)

- (void)configurationLaunchUserOption{
    //相对于上面的接口，这个接口可以动画的改变statusBar的前景色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

/**
 *  友盟注册
 */
- (void)registerUMeng{
    
}

/**
 *  极光推送注册和配置
 */
- (void)registerJPushAndConfigurationLaunchUserOptionWithOptions:(NSDictionary *)launchOptions delegate:(id<JPUSHRegisterDelegate>)delegate{
    //NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        JPUSHRegisterEntity *entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:delegate];
    }else if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0){
        //可以添加自定义的categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert ) categories:nil];
    }else{
        //categories 必须为nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil];
    }
    //Required
    // init Push(2.1.5版本的SDK新增的注册 法，改成可上报IDFA，如果没有使 IDFA直接传nil ) // 如需继续使 pushConfig.plist 件声明appKey等配置内容，请依旧使 [JPUSHService setupWithOption:launchOptions] 式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:kYXBJPushAppKey channel:channel apsForProduction:isProduction advertisingIdentifier:nil];
}

/**
 *      自定义消息
 @param notification notification
 */
- (void)networkDidReceiveMessage:(NSNotification *)notification{
//    NSDictionary *userInfo = [notification userInfo];
//    NSString *content = [userInfo valueForKey:@"centent"];
//    NSDictionary *extras = [userInfo valueForKey:@"extras"];
//    //服务端传递的Extras附加字段，key是自己定义的
//    NSString *customizeField = [extras valueForKey:@"customizeField"];
}

/**
 *  Mob注册 短信验证
 */
- (void)registerMob{
    
}

/**
 *  检查更新
 */
- (void)checkAppUpDataWithshowOption:(BOOL)showOption{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *currentVerisonId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    //安装后第一次启动引导页
    if ([userDefaults boolForKey:currentVerisonId]) {
        
        XXYLoginViewController *loginVC = [[XXYLoginViewController alloc] init];
        UINavigationController *loginNVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
        self.window.rootViewController = loginNVC;
    }else{
        
        LanughViewController *lanughVC = [[LanughViewController alloc] init];
        self.window.rootViewController = lanughVC;
        [userDefaults setBool:YES forKey:currentVerisonId];
        [userDefaults synchronize];
    }
}

/**
 *  上传用户设备信息
 */
- (void)upLoadMessageAboutUser{}
@end
