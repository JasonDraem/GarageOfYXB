//
//  YXBManagerFinishedView.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBManagerFinishedView.h"
#import <Masonry/Masonry.h>
#import "XXYSubViewsTool.h"

@implementation YXBManagerFinishedView
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
    self.recoderButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"语音描述" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selAction:@selector(clickAction)];
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
    //电话图标
    self.phoneImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[UIImage imageNamed:@"phone-02"]];
    [self.contentView addSubview:self.phoneImageView];
    //电话号码
    self.callPhoneButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"13342620234" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selAction:@selector(callPhoneAction)];
    self.callPhoneButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.callPhoneButton];
    //位置图标
    self.locationImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[UIImage imageNamed:@"location-01"]];
    [self.contentView addSubview:self.locationImageView];
    //位置
    self.locationLabel = [XXYSubViewsTool xxyLabelWithBackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:15.0f];
    self.locationLabel.text = @"南京市鼓楼区草场门大街江东中路";
    [self.contentView addSubview:self.locationLabel];
    //时间图标
    self.timeImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[UIImage imageNamed:@"calendar"]];
    [self.contentView addSubview:self.timeImageView];
    //时间
    self.timeLabel = [XXYSubViewsTool xxyLabelWithBackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:15.0f];
    self.timeLabel.text = @"取车时间：2016年9月17日";
    [self.contentView addSubview:self.timeLabel];

    //布局
    [self layoutSubviewsHandler];
}
/**
 *  布局控件
 */
- (void)layoutSubviewsHandler{
    weakify(self)
    //contentview
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.mas_top).with.offset(10 * kViewHeightScale);
        make.left.mas_equalTo(weak_self.mas_left).with.offset(10 * kViewWidthScale);
        make.bottom.mas_equalTo(weak_self.mas_bottom).with.offset(-80);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(-10 * kViewWidthScale);
    }];
    //车架号维修详情
    [self.ChassisNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.contentView.mas_top).with.offset(5 * kViewHeightScale);
        make.left.equalTo(weak_self.contentView.mas_left);
        make.right.equalTo(weak_self.contentView.mas_right);
        make.height.mas_equalTo(20 * kViewHeightScale);
    }];
    //滚动视图view
    CGFloat scViewHeight = self.frame.size.height / 4;
    [self.scrollViewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.ChassisNumberLabel.mas_bottom).with.offset(15 * kViewHeightScale);
        make.left.mas_equalTo(weak_self.contentView.mas_left).with.offset(10 * kViewWidthScale);
        make.right.mas_equalTo(weak_self.contentView.mas_right).with.offset(-10 * kViewWidthScale);
        make.height.mas_equalTo(scViewHeight);
    }];
    //播放按钮
    [self.recoderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.scrollViewView.mas_bottom).with.offset(15 * kViewHeightScale);
        make.left.mas_equalTo(weak_self.scrollViewView.mas_left).with.offset(10 * kViewWidthScale);
        make.right.mas_equalTo(weak_self.scrollViewView.mas_right).with.offset(-10 * kViewWidthScale);
        make.height.mas_equalTo(50 * kViewHeightScale);
    }];
    //车辆修理情况描述
    [self.descriptionTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.recoderButton.mas_bottom).with.offset(15 * kViewHeightScale);
        make.left.equalTo(weak_self.recoderButton.mas_left);
        make.right.equalTo(weak_self.recoderButton.mas_right);
        make.height.mas_equalTo(scViewHeight);
    }];
    //电话图标
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.descriptionTextView.mas_bottom).with.offset(10 * kViewHeightScale);
        make.left.equalTo(weak_self.descriptionTextView.mas_left);
        make.size.mas_equalTo(CGSizeMake(16 * kViewWidthScale, 16 * kViewWidthScale));
    }];
    //电话号码
    CGFloat phoneWidth = self.frame.size.width / 3 * kViewWidthScale;
    [self.callPhoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.phoneImageView.mas_top);
        make.left.mas_equalTo(weak_self.phoneImageView.mas_right).with.offset(20 * kViewWidthScale);
//        make.size.mas_equalTo(CGSizeMake(phoneWidth, 16));
        make.bottom.equalTo(weak_self.phoneImageView.mas_bottom);
        make.width.mas_equalTo(phoneWidth);
    }];
    //位置图标
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.phoneImageView.mas_bottom).with.offset(10 * kViewHeightScale);
        make.left.mas_equalTo(weak_self.descriptionTextView.mas_left);
        make.size.equalTo(weak_self.phoneImageView);
    }];
    //位置
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.locationImageView.mas_top);
        make.left.equalTo(weak_self.callPhoneButton.mas_left);
        make.right.equalTo(weak_self.descriptionTextView.mas_right);
        make.bottom.equalTo(weak_self.locationImageView.mas_bottom);
    }];
    //时间图标
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.locationImageView.mas_bottom).with.offset(10 * kViewHeightScale);
        make.left.equalTo(weak_self.locationImageView.mas_left);
        make.size.equalTo(weak_self.locationImageView);
    }];
    //时间
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.timeImageView.mas_top);
        make.left.equalTo(weak_self.callPhoneButton.mas_left);
        make.right.equalTo(weak_self.descriptionTextView.mas_right);
        make.bottom.equalTo(weak_self.timeImageView.mas_bottom);
    }];
}
/**
 *  语音播放
 */
- (void)clickAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(playRecoredHandler)]) {
        [self.delegate playRecoredHandler];
    }
}
/**
 *  拨打电话
 */
- (void)callPhoneAction{
    if (self.delegate && [self.delegate respondsToSelector:@selector(callPhoneHandler)]) {
        [self.delegate callPhoneHandler];
    }
}
/**
 *  刷新数据 
 */
- (void)updataWithModel{
    
}

@end
