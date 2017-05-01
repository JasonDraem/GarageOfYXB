//
//  YXBPendingDetailView.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBPendingDetailView.h"
#import "XXYSubViewsTool.h"
#import <Masonry/Masonry.h>

@implementation YXBPendingDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubViews];
    }
    return self;
}

/**
 *  初始化控件
 */
- (void)setupSubViews{
    //contentview
    self.contentView = [[UIView alloc] init];
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentView.layer.borderWidth = 1.0f;
    //self.contentView.backgroundColor = [UIColor redColor];
    [self addSubview:self.contentView];
    //车架号维修详情
    self.ChassisNumberLabel = [XXYSubViewsTool xxyLabelWithBackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:18.0f];
    self.ChassisNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.ChassisNumberLabel.text = @"车架号维修详情";
    [self.contentView addSubview:self.ChassisNumberLabel];
    //滚动视图view
    self.scrollViewView = [[UIView alloc] init];
    self.scrollViewView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.scrollViewView];
    //播放语音
    self.recoderButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"语音描述" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selAction:@selector(clickButtonAction)];
    [self.recoderButton setImage:[UIImage imageNamed:@"horn"] forState:UIControlStateNormal];
    self.recoderButton.layer.borderWidth = 1.0f;
    self.recoderButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.contentView addSubview:self.recoderButton];
    //损坏描述
    self.descriptionTextView = [[UITextView alloc] init];
    self.descriptionTextView.text = @"车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v 车辆修理情况描述 v 车辆修理情况描述 v 车辆修理情况描述v v v车辆修理情况描述 v车辆修理情况描述 vv车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述v车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述 v车辆修理情况描述 vv车辆修理情况描述车辆修理情况描述 v车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述 v车辆修理情况描述 v车辆修理情况描述 v车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 车辆修理情况描述 v车辆修理情况描述v v v v v v 车辆修理情况描述车辆修理情况描述";
    self.descriptionTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.descriptionTextView.layer.borderWidth = .5f;
    self.descriptionTextView.editable = NO;
    [self.contentView addSubview:self.descriptionTextView];
    //
    
    //布局
    [self layoutSubviewsHandler];
}
/**
 *  布局控件
 */
- (void)layoutSubviewsHandler{
    
}

- (void)clickButtonAction{
}


@end
