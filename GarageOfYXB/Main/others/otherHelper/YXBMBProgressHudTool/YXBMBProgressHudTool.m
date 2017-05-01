//
//  YXBMBProgressHudTool.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBMBProgressHudTool.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YXBMBProgressHudTool (){
    MBProgressHUD *_hud;
}

@end

@implementation YXBMBProgressHudTool
+ (instancetype)shareInstance{
    static YXBMBProgressHudTool *_hudTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hudTool = [[YXBMBProgressHudTool alloc] init];
    });
    return _hudTool;
}

- (void)showMBProgressShowAddedTo:(UIView *)view text:(NSString *)text{
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.labelText = text;
    //_hud.label.text= text;
    //_hud.backgroundColor = [UIColor grayColor];
}

- (void)showMBProgressShowAddedTo:(UIView *)view
                       hudBgColor:(UIColor *)hudBgColor
                             text:(NSString *)text
                         textFont:(CGFloat)font
                        textColor:(UIColor *)textColor
           activityIndicatorColor:(UIColor *)activityIndicatorColor {
    
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.labelFont = [UIFont systemFontOfSize:font];
    _hud.labelColor = textColor;
    _hud.color = hudBgColor;
    _hud.labelText = text;
//    _hud.bezelView.backgroundColor = hudBgColor;
//    _hud.label.text= text;
//    _hud.label.font = [UIFont systemFontOfSize:font];
//    _hud.label.textColor = textColor;
    //菊花颜色
    _hud.activityIndicatorColor = activityIndicatorColor;
}


- (void)dismissMBProgress{
    //[_hud hideAnimated:YES afterDelay:2.0f];
    [_hud hide:YES afterDelay:2.0f];
    _hud = nil;
}


@end
