//
//  AppDelegate.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+YXBAppService.h"

@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //基本设置
    [self configurationLaunchUserOption];
    //检查更新
    [self checkAppUpDataWithshowOption:YES];
    //推送
    [self registerJPushAndConfigurationLaunchUserOptionWithOptions:launchOptions delegate:self];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 推送相关
//注册APNs 成功并上报Device Token
- (void)application:(UIApplication *)applicaiton didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    //Required -  注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}
//实现注册APNs失败接口(可选)
- (void)application:(UIApplication *)applicaiton didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error{
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error:%@", error);
}
//添加处理APNs通知回调方法
#pragma mark - JPUSHRegisterDelegate
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler{
    //Required
    NSDictionary *userInfo = notification.request.content.userInfo;
    if ([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    //需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
    //用户必须选择这个
    completionHandler(UNNotificationPresentationOptionAlert);
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    //Required
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        //系统需要执行这个方法
        completionHandler();
    }
}

- (void)application:(UIApplication *)applicaiton didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler{
    //Required,iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)applicaiton didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo{
    //Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}

@end
