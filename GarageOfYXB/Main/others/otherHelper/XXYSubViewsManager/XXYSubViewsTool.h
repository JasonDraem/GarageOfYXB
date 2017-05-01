//
//  XXYSubViewsTool.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXYSubViewsTool : NSObject
/**
 *  登录界面segmentcontrol
 *
 *  @param titles 分栏的名字
 *
 *  @return 
 */
+ (UISegmentedControl *)xxySegmentControlWithTitles:(NSArray *)titles;
/**
 *  登录界面图标imageview
 *
 *  @param image image
 *
 *  @return imageview
 */
+ (UIImageView *)xxyLoginImageViewToolWithImage:(UIImage *)image;
/**
 *  输入框
 *
 *  @param placeholder 占位字
 *
 *  @return tf
 */
+ (UITextField *)xxyLoginTextFieldToolWithPlaceholder:(NSString *)placeholder tag:(NSInteger)tag;

/**
 *  获取短信验证码按钮
 *
 *  @param title           获取验证码标题
 *  @param tintColor       字体颜色
 *  @param backgroundColor 背景色
 *
 *  @return button
 */
+(UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                        tintColor:(UIColor *)tintColor
                  backgroundColor:(UIColor *)backgroundColor
                           target:(id)target
                        selAction:(SEL)action;
/**
 *  可设置边框 button
 *
 *  @param title           标题
 *  @param tintColor       前景色
 *  @param backgroundColor 背景色
 *  @param borderColor     边框颜色
 *  @param borderWidth     边框宽度
 *  @param target          事件对象
 *  @param action          事件
 *
 *  @return <#return value description#>
 */
+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            tintColor:(UIColor *)tintColor
                      backgroundColor:(UIColor *)backgroundColor
                           borderColor:(CGColorRef)borderColor
                            borderWidth:(CGFloat)borderWidth
                               target:(id)target
                            selAction:(SEL)action;
/**
 *  分界线
 *
 *  @return linview
 */
+ (UIView *)xxyLoginLineTool;
/**
 *  显示label 不带标题参数
 *
 *  @param bgColor   背景色
 *  @param textColor 字体颜色
 *  @param textFont  字体大小
 *
 *  @return <#return value description#>
 */
+ (UILabel *)xxyLabelWithBackgroundColor:(UIColor *)bgColor
                               textColor:(UIColor *)textColor
                                textFont:(CGFloat)textFont;
/**
 *  显示label 带标题参数
 *
 *  @param text      标题
 *  @param bgColor   背景色
 *  @param textColor 字体颜色
 *  @param textFont  字体大小
 *
 *  @return <#return value description#>
 */
+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont;
@end
