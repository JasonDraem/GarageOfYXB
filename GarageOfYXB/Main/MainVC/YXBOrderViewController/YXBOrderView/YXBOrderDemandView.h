//
//  YXBOrderDemandView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/26.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXBOrderDemandViewDelegate <NSObject>

- (void)voiceBroadcastHandler;

- (void)callCustomerPhoneHandler;

@end

@interface YXBOrderDemandView : UIView
/* 车牌号 */
@property (nonatomic, strong) UILabel *carNumberLabel;
/* view */
@property (nonatomic, strong) UIView *scView;
/* 滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/* 语音播放按钮 */
@property (nonatomic, strong) UIButton *recordButton;
/* 损坏描述 */
@property (nonatomic, strong) UIView *descriptionView;
@property (nonatomic, strong) UITextView *descriptonTextView;
/* 电话图片 */
@property (nonatomic, strong) UIImageView *phoneIconImageView;
/* 电话按钮 */
@property (nonatomic, strong) UIButton *phoneButton;
/* 位置图标 */
@property (nonatomic, strong) UIImageView *locationImageView;
/* 位置 */
@property (nonatomic, strong) UILabel *locationLabel;
//构造代理
@property (nonatomic, weak) id<YXBOrderDemandViewDelegate>remandViewDelegate;

/**
 *  更新数据
 */
- (void)updataWithModel;
@end
