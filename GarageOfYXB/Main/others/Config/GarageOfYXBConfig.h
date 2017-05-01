//
//  GarageOfYXBConfig.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/12.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#ifndef GarageOfYXBConfig_h
#define GarageOfYXBConfig_h

#define kPushPhotoBrowserNotifitationName @"PushPhotoBrowser"
#define kPresentVideoPlayerNotifitationName @"playCallBackVideo"
#define APPICONIMAGE [UIImage imageNamed:[[[[NSBundle mainBundle] infoDictionary] valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]]
#define APPNAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
//#define Main_Color [UIColor colorWithRed:(3)/255.0 green:(160)/255.0 blue:(235)/255.0 alpha:1.0]
//#define Main2_Color [UIColor colorWithRed:(135)/255.0 green:(202)/255.0 blue:(231)/255.0 alpha:1.0]
//#define VTColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//#define Text_Color [UIColor colorWithRed:(51)/255.0 green:(71)/255.0 blue:(113)/255.0 alpha:1.0]
//#define BackGround_Color [UIColor colorWithRed:(235)/255.0 green:(235)/255.0 blue:(241)/255.0 alpha:1.0]
//#define Default_Person_Image [UIImage imageNamed:@"default_parents"]
//#define Default_General_Image [UIImage imageNamed:@"default_general"]
//#define kScreenW [UIScreen mainScreen].bounds.size.width
//#define kScreenH [UIScreen mainScreen].bounds.size.height
#define XXYNotificationCenter [NSNotificationCenter defaultCenter]

#ifdef DEBUG
#define XXYLog(...) NSLog(__VA_ARGS__)
#else
#define XXYLog(...)
#endif

#define XXYLogFunc XXYLog(@"%s", __func__)

#define XXYColor(r, g, b, al) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/ 255.0) alpha:al]

#define XXYGlobalBg XXYColor(223, 223, 223)
#define XXYGlobalSpaceColor [UIColor colorWithHexString:@"#efefef"]

#define XXYScreenW [UIScreen mainScreen].bounds.size.width
#define XXYScreenH [UIScreen mainScreen].bounds.size.height
#define XXYScreenBounds [UIScreen mainScreen].bounds
#define XXYNavgationBarHeight   64.0f

#define kIphone6ScreenHeight    667.0f
#define kIphone6ScreenWidth     375.0f

#define kViewWidthScale (XXYScreenW / kIphone6ScreenWidth)
#define kViewHeightScale (XXYScreenH / kIphone6ScreenHeight)
//获取image
#define GetImage(imageName)     [UIImage imageNamed:imageName]
//超时时间处理
#define kTimeoutInterval 30.0f
//语音沙河路径
#define DocumentPath  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//判断当前设备机型是否为6
#define kIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define ISNSStringValid(x) (x != NULL && [x length] > 0)

#pragma mark - weakify & strongify
#ifndef    weakify
#if __has_feature(objc_arc)
#define weakify(object) __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) __block __typeof__(object) block##_##object = object;
#endif
#endif
#ifndef    strongify
#if __has_feature(objc_arc)
#define strongify(object) __typeof__(object) strong##_##object = weak##_##object;
#else
#define strongify(object) __typeof__(object) strong##_##object = block##_##object;
#endif
#endif

#define kYXBGENERALColor_BlackColor        [UIColor blackColor]
#define kYXBTextGeneralColor_WhiteColor    [UIColor whiteColor]
//各种第三方服务商的appId或者App key
#define kYXBJPushAppKey                     (@"")
#define kYXBUMShareAppKey                   (@"")
//判断是否登陆key
#define kLoginStatusID                      (@"USER_IDKEY")

#pragma mark - 极光推送相关事件监听类型
//extern NSString *const kJPFNetworkIsConnectingNotification; // 正在连接中
//extern NSString * const kJPFNetworkDidSetupNotification; // 建立连接
//extern NSString * const kJPFNetworkDidCloseNotification; // 关闭连接
//extern NSString * const kJPFNetworkDidRegisterNotification; // 注册成功
//extern NSString *const kJPFNetworkFailedRegisterNotification; //注册失败
//extern NSString * const kJPFNetworkDidLoginNotification; // 登录成功
//extern NSString * const kJPFNetworkDidReceiveMessageNotification; // 收到自定义消息(非APNs)
//

#endif /* GarageOfYXBConfig_h */
