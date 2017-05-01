//
//  YXBOrderDemandView.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/26.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBOrderDemandView.h"
#import "XXYSubViewsTool.h"

#import <Masonry/Masonry.h>

@implementation YXBOrderDemandView

- (instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
//初始化控件
- (void)setupSubViews{
    //车牌号
    self.carNumberLabel = [XXYSubViewsTool xxyLabelWithBackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:18.0f];
    self.carNumberLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.carNumberLabel];
    //滚动视图view
    self.scView = [[UIView alloc] init];
    self.scView.backgroundColor = [UIColor greenColor];
    [self addSubview:self.scView];
    //语音播放按钮
    self.recordButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"播放语音" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selAction:@selector(voiceRecordHandler)];
    //self.recordButton.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
    
    [self.recordButton setImage:[[UIImage imageNamed:@"horn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    //self.recordButton.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 21,self.recordButton.titleLabel.bounds.size.width);
    self.recordButton.layer.borderColor = [[UIColor grayColor] CGColor];
    self.recordButton.layer.borderWidth = 0.5f;
    [self addSubview:self.recordButton];
    //事故显示view
    self.descriptionView = [XXYSubViewsTool xxyLoginLineTool];
    self.descriptionView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.descriptionView];
    //电话图标imageview
    self.phoneIconImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[[UIImage imageNamed:@"phone-02"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    [self addSubview:self.phoneIconImageView];
    //电话按钮
    self.phoneButton = [XXYSubViewsTool xxyLoginButtonWithTitle:@"18637333739" tintColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] target:self selAction:@selector(callPhoneHandler)];
    [self addSubview:self.phoneButton];
    //位置图标
    self.locationImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[[UIImage imageNamed:@"location-01"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addSubview:self.locationImageView];
    //位置
    self.locationLabel = [XXYSubViewsTool xxyLabelWithBackgroundColor:[UIColor whiteColor] textColor:[UIColor blackColor] textFont:15.0f];
    [self addSubview:self.locationLabel];
    //布局
    [self layoutSubviewsHandler];
}
//布局控件
- (void)layoutSubviewsHandler{
    weakify(self)
    [self.carNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.mas_top).with.offset(20*kViewHeightScale);
        make.left.mas_equalTo(weak_self.mas_left);
        make.right.mas_equalTo(weak_self.mas_right);
        make.height.mas_equalTo(30*kViewHeightScale);
    }];
    //滚动视图view
    CGFloat height = self.frame.size.height / 4;
    [self.scView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.carNumberLabel.mas_bottom).with.offset(10*kViewHeightScale);
        make.left.equalTo(weak_self.mas_left);
        make.right.equalTo(weak_self.mas_right);
        make.height.mas_equalTo(height * kViewHeightScale);
    }];
    //播放录音按钮
    [self.recordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.scView.mas_bottom).with.offset(10*kViewHeightScale);
        make.left.mas_equalTo(15*kViewWidthScale);
        make.right.mas_equalTo(-15*kViewWidthScale);
        make.height.mas_equalTo(50*kViewHeightScale);
    }];
    //事故介绍显示
    [self.descriptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.recordButton.mas_bottom).with.offset(10*kViewHeightScale);
        make.left.equalTo(weak_self.recordButton.mas_left);
        make.right.equalTo(weak_self.recordButton.mas_right);
        make.height.equalTo(weak_self.scView.mas_height);
    }];
    //电话图标
    [self.phoneIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.descriptionView.mas_bottom).with.offset(10*kViewHeightScale);
        make.left.equalTo(weak_self.descriptionView.mas_left).with.offset(20*kViewWidthScale);
        make.size.mas_equalTo(CGSizeMake(20*kViewWidthScale, 20*kViewWidthScale));
    }];
    //电话号码
    CGFloat width = self.frame.size.width / 3;
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.phoneIconImageView.mas_top);
        make.left.mas_equalTo(weak_self.phoneIconImageView.mas_right).with.offset(20*kViewWidthScale);
        make.bottom.equalTo(weak_self.phoneIconImageView.mas_bottom);
        make.width.mas_equalTo(width*kViewWidthScale);
    }];
    //位置图标
    [self.locationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.phoneIconImageView.mas_bottom).with.offset(10*kViewHeightScale);
        make.left.equalTo(weak_self.phoneIconImageView.mas_left);
        make.size.equalTo(weak_self.phoneIconImageView);
    }];
    //位置
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weak_self.locationImageView.mas_top);
        make.left.equalTo(weak_self.phoneButton.mas_left);
        make.right.equalTo(weak_self.descriptionView.mas_right);
        make.height.equalTo(weak_self.phoneButton.mas_height);
    }];
}

#pragma mark -
- (void)voiceRecordHandler{
    if (self.remandViewDelegate && [self.remandViewDelegate respondsToSelector:@selector(voiceBroadcastHandler)]) {
        [self.remandViewDelegate voiceBroadcastHandler];
    }
}

- (void)callPhoneHandler{
    if (self.remandViewDelegate && [self.remandViewDelegate respondsToSelector:@selector(callCustomerPhoneHandler)]) {
        [self.remandViewDelegate callCustomerPhoneHandler];
    }
}

- (void)updataWithModel{
    self.carNumberLabel.text = @"车牌号：皖A CA320";
    self.locationLabel.text = @"南京市鼓楼区草场门大街江东中路";
}

@end
