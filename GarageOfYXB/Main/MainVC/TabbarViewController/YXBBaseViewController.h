//
//  YXBBaseViewController.h
//  GarageOfYXB
//
//  Created by 周继洋 on 16/9/22.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh/MJRefresh.h>
/**
 *  判断当前加载数据类型
 */
typedef NS_ENUM(NSInteger, XXYGetDataType) {
    /**
     *  默认正常
     */
    XXYGetDataNormalRefresh = 0,
    /**
     *  刷新状态
     */
    XXYGetDataHeaderRefresh = 1,
    /**
     *  加载状态
     */
    XXYGetDataFooterRefresh = 2
};


@interface YXBBaseViewController : UIViewController
{
    XXYGetDataType _getDataType;
    NSInteger _currentPage;
    BOOL _isLoading;
}
/**
 *  下拉刷新
 */
- (void)getDataHeaderRefresh;
/**
 *  上拉加载
 */
- (void)getDataFooterRefresh;
/**
 *  更改默认状态提示
 *
 *  @param header <#header description#>
 */
- (void)changeStatesText:(MJRefreshNormalHeader *)header;

@end
