//
//  YXBFMDataBaseManager.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBFMDataBaseManager.h"
#import <FMDB/FMDB.h>

@implementation YXBFMDataBaseManager
{
    FMDatabase *_yxbFMDataBase;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //数据保存路径
        NSString *databasePath = [NSString stringWithFormat:@"%@/Library/YXBDatabase.db", NSHomeDirectory()];
        _yxbFMDataBase = [FMDatabase databaseWithPath:databasePath];
    }
    return self;
}

/**
 创建databaseManager

 @return shareInstance
 */
+ (YXBFMDataBaseManager *)databaseManager{
    static YXBFMDataBaseManager *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[YXBFMDataBaseManager alloc] init];
    });
    return shareInstance;
}

/**
 执行executeSpl

 @param exeSql <#exeSql description#>
 */
- (void)executeSql:(ExecuteSqlBlock)exeSql{
    //打开数据库
    BOOL openSuccess = [_yxbFMDataBase open];
    //执行SQL操作
    exeSql(_yxbFMDataBase , openSuccess);
    //关闭数据库
    [_yxbFMDataBase close];
}

@end
