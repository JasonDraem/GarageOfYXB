//
//  YXBMBProgressHudTool.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXBMBProgressHudTool : NSObject
/**
 *   单例
 *
 *  @return 防止多次创建
 */
+ (instancetype)shareInstance;
/**
 *  加载提示框
 *
 *  @param view UIview
 *  @param text text
 */
- (void)showMBProgressShowAddedTo:(UIView *)view
                             text:(NSString *)text;
/**
 *  自定义加载提示框
 *
 *  @param view                   view
 *  @param hudBgColor             hud 背景色
 *  @param text                   提示语
 *  @param font                   字体大小
 *  @param textColor              字体颜色
 *  @param activityIndicatorColor 菊花颜色
 */
- (void)showMBProgressShowAddedTo:(UIView *)view
                       hudBgColor:(UIColor *)hudBgColor
                             text:(NSString *)text
                         textFont:(CGFloat)font
                        textColor:(UIColor *)textColor
           activityIndicatorColor:(UIColor *)activityIndicatorColor;
/**
 *  hud消失
 */
- (void)dismissMBProgress;
@end
