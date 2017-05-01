//
//  YXBTabbarViewController.m
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBTabbarViewController.h"
#import "YXBBaseViewController.h"

@interface YXBTabbarViewController ()

@end

@implementation YXBTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBarController];
}
/**
 *  tabbar
 */
- (void)createTabBarController{
    self.tabBar.barTintColor = [UIColor whiteColor];
    NSArray *tabbarArray = @[@[@"接单", @"order"],
                              @[@"经营", @"bussness"],
                              @[@"管理", @"manager"],
                              @[@"我的", @"mine"]
                              ];
    NSArray *controllerTitle = @[@"YXBOrder", @"YXBBussness", @"YXBManager", @"YXBMine"];
    NSMutableArray *controllersArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < tabbarArray.count; i ++) {
        NSString *controllerName = [NSString stringWithFormat:@"%@ViewController", controllerTitle[i]];
        Class className = NSClassFromString(controllerName);
        YXBBaseViewController *baseVC = [[className alloc] init];
        UINavigationController *yxbNVC = [[UINavigationController alloc] initWithRootViewController:baseVC];
        baseVC.navigationItem.title = tabbarArray[i][0];
        NSString *imageName = [NSString stringWithFormat:@"%@_", tabbarArray[i][1]];
        //NSLog(@"%@", imageName);
        UIImage *normalImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@normal", imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //
        UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@selected", imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:tabbarArray[i][0] image:normalImage selectedImage:selectedImage];
        baseVC.tabBarItem = item;
        
        [controllersArr addObject:yxbNVC];
    }
    //
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:XXYColor(169, 183, 183, 1.0f), NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    //
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:XXYColor(96, 176, 230, 1.0f), NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    //
    [[UITabBar appearance] setBackgroundColor:[UIColor redColor]];
    [UITabBar appearance].translucent = NO;
    
    //设置选中item背景色
//    CGSize indicatorImageSize = CGSizeMake(self.tabBar.bounds.size.width / self.tabBar.items.count, self.tabBar.bounds.size.height);
//    self.tabBar.selectionIndicatorImage = [self drawTabbarItemBackgroundImageWithSize:indicatorImageSize];
    
    self.viewControllers = controllersArr;
}
/**
 *  绘制选中item的背景色
 *
 *  @param size
 *
 *  @return size
 */
- (UIImage *)drawTabbarItemBackgroundImageWithSize:(CGSize)size{
    //准备画图
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(ctx, 124.0/255.0, 124.0/255.0, 151.0/255.0, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    
    //获取该绘图中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //结束绘图
    UIGraphicsEndImageContext();
    return image;
}
/**
 去除tabbar分界线
 */
- (void)removeLineOnTabbar{
    CGRect rect = CGRectMake(0, 0, XXYScreenW, XXYScreenH);
    //strat drawImage
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //over drawImage
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:image];
    [self.tabBar setShadowImage:image];
}
































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
