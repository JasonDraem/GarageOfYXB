//
//  YXBManagerFinishedView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXBManagerFinishedViewDelegate <NSObject>
/**
 *  播放语音功能
 */
- (void)playRecoredHandler;
/**
 *  拨打电话
 */
- (void)callPhoneHandler;

@end

@interface YXBManagerFinishedView : UIView
/* contentView */
@property (nonatomic, strong) UIView *contentView;
/* 车架号 lable */
@property (nonatomic, strong) UILabel *ChassisNumberLabel;
/* 贴滚动视图view */
@property (nonatomic, strong) UIView *scrollViewView;
/* 播放语音按钮 */
@property (nonatomic, strong) UIButton *recoderButton;
/* 展示车辆受损描述 */
@property (nonatomic, strong) UITextView *descriptionTextView;
/* 电话图标 */
@property (nonatomic, strong) UIImageView *phoneImageView;
/* 拨打电话按钮 */
@property (nonatomic, strong) UIButton *callPhoneButton;
/* 位置图标 */
@property (nonatomic, strong) UIImageView *locationImageView;
/* 展示位置 */
@property (nonatomic, strong) UILabel *locationLabel;
/* 取车图标 */
@property (nonatomic, strong) UIImageView *timeImageView;
/* 取车时间 */
@property (nonatomic, strong) UILabel *timeLabel;

/* 构造协议 */
@property (nonatomic, strong) id <YXBManagerFinishedViewDelegate>delegate;

/**
 *  更新数据
 */
- (void)updataWithModel;

@end
