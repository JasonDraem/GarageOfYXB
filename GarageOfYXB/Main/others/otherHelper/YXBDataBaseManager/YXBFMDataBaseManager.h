//
//  YXBFMDataBaseManager.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 2016/10/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FMDatabase;

typedef void(^ExecuteSqlBlock)(FMDatabase *, BOOL);


@interface YXBFMDataBaseManager : NSObject

/**
 <#Description#>

 @return <#return value description#>
 */
+ (YXBFMDataBaseManager *)databaseManager;
/**
 *  执行sql语句，严禁在block（ExecuteSql）里面调用executeSql方法
 *
 *  @param exeSql
 */
- (void)executeSql:(ExecuteSqlBlock)exeSql;
@end
