//
//  YXBLoginStatusManager.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/19.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBLoginStatusManager.h"

@implementation YXBLoginStatusManager

#pragma mark -- 是否登录
-(BOOL)isUserLogin{
    NSString *userId =  [[NSUserDefaults standardUserDefaults] objectForKey:kLoginStatusID];
    if (userId != nil && [userId intValue] > 0){
        //已经登录
        return YES;
    }
    return NO;
}

@end
