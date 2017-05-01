//
//  YXBPendingDetailView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXBPendingDetailView : UIView
/* contentView */
@property (nonatomic, strong) UIView *contentView;
/* 编辑按钮 */
@property (nonatomic, strong) UIButton *editorButton;
/* 车架号 lable */
@property (nonatomic, strong) UILabel *ChassisNumberLabel;
/* 贴滚动视图view */
@property (nonatomic, strong) UIView *scrollViewView;
/* 播放语音按钮 */
@property (nonatomic, strong) UIButton *recoderButton;
/* 展示车辆受损描述 */
@property (nonatomic, strong) UITextView *descriptionTextView;
/* 发送按钮 */
@property (nonatomic, strong) UIButton *sendButton;

@end
