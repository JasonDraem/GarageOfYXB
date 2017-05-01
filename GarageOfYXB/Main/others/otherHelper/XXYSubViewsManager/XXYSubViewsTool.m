//
//  XXYSubViewsTool.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/17.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYSubViewsTool.h"
/* segment tintcolor */
#define kXXYSubViewsToolSegmentTintColor           XXYColor(35, 205, 253, .1)
/* segment 选中的背景图 */
#define kXXYSubViewsToolSelectedColor              XXYColor(35, 205, 253, 1.0)
/*  */
#define kXXYSubViewsToolLoginToolTFPlaceHolder   (@"b3a28d")

@implementation XXYSubViewsTool

+ (UISegmentedControl *)xxySegmentControlWithTitles:(NSArray *)titles{
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:titles];
    segmentedControl.selectedSegmentIndex = 0;
    
    segmentedControl.tintColor = kXXYSubViewsToolSegmentTintColor;
    segmentedControl.layer.borderWidth = 1.5f;
    segmentedControl.layer.borderColor = [kXXYSubViewsToolSelectedColor CGColor];
    //normalStatus
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    //selectedStatus
    [segmentedControl setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:kXXYSubViewsToolSelectedColor} forState:UIControlStateSelected];
    [segmentedControl setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
    return segmentedControl;
}

+ (UIImageView *)xxyLoginImageViewToolWithImage:(UIImage *)image{

    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.image = image;
    return iconImageView;
}

+ (UITextField *)xxyLoginTextFieldToolWithPlaceholder:(NSString *)placeholder tag:(NSInteger)tag{
    UITextField *tf = [[UITextField alloc] init];
    tf.clearButtonMode = UITextFieldViewModeUnlessEditing;
    tf.placeholder = placeholder;
    tf.textColor = [UIColor grayColor];
    tf.font = [UIFont systemFontOfSize:15];
    tf.keyboardType = UIKeyboardTypeDefault;
    tf.borderStyle = UITextBorderStyleNone;
    tf.backgroundColor = [UIColor clearColor];
    tf.exclusiveTouch = YES;
    // 创建一个富文本对象
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置富文本对象的颜色
    attributes[NSForegroundColorAttributeName] = [UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder];
    //设置富文本对象的字体大小
    attributes[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    // 设置UITextField的占位文字
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attributes];
    //
    tf.layer.borderColor = [[UIColor clearColor] CGColor];
    tf.layer.borderWidth = 1;
    tf.tintColor = [UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder];
    
    if (1001 == tag) {
        tf.secureTextEntry = YES;
    }
    return tf;
}

+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            tintColor:(UIColor *)tintColor
                      backgroundColor:(UIColor *)backgroundColor
                               target:(id)target selAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.tintColor= tintColor;
    //[button sizeToFit];
    //button.layer.cornerRadius = 22;
    [button setTitleColor:tintColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)xxyLoginButtonWithTitle:(NSString *)title
                            tintColor:(UIColor *)tintColor
                      backgroundColor:(UIColor *)backgroundColor
                          borderColor:(CGColorRef)borderColor
                          borderWidth:(CGFloat)borderWidth
                               target:(id)target
                            selAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.exclusiveTouch = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroundColor;
    button.tintColor= tintColor;
    button.layer.borderColor = borderColor;
    button.layer.borderWidth = borderWidth;
    //[button sizeToFit];
    button.layer.cornerRadius = 2;
    [button setTitleColor:tintColor forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHexString:kXXYSubViewsToolLoginToolTFPlaceHolder] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIView *)xxyLoginLineTool{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor xxy_blackColor];
    return lineView;
}

+ (UILabel *)xxyLabelWithBackgroundColor:(UIColor *)bgColor
                               textColor:(UIColor *)textColor
                                textFont:(CGFloat)textFont{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:textFont];
    return label;
}

+ (UILabel *)xxyLabelWithText:(NSString *)text
              BackgroundColor:(UIColor *)bgColor
                    textColor:(UIColor *)textColor
                     textFont:(CGFloat)textFont{
    
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.backgroundColor = bgColor;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:textFont];
    return label;
}























@end
