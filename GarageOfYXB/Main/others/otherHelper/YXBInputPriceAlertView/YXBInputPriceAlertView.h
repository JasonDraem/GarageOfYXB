//
//  YXBInputPriceAlertView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/29.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  完成block
 *
 *  @param projectNameStr 项目名称
 *  @param priceStr       价格
 */
typedef void(^CompleteBlock)(NSString *projectNameStr, NSString *priceStr);
/**
 *  取消block
 */
typedef void(^CancelBlock)();

@interface YXBInputPriceAlertView : UIWindow
/**
 *  添加项目
 *
 *  @param completeBlock 完成操作
 *  @param cancelBlock   取消操作
 */
- (void)showPriceAlertViewWithCompleteAction:(CompleteBlock)completeBlock
                                 cancelBlock:(CancelBlock)cancelBlock;
/* 完成block */
@property (nonatomic, copy) CompleteBlock resultBlock;
/* 取消block */
@property (nonatomic, copy) CancelBlock cancelBlock;

@end
