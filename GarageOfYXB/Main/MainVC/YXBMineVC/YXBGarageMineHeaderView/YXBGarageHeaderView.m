//
//  YXBGarageHeaderView.m
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/25.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBGarageHeaderView.h"
#import "XXYSubViewsTool.h"

#import <Masonry/Masonry.h>

@implementation YXBGarageHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
        //
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
/**
 *  初始化控件
 */
- (void)setupSubViews{
    //修理厂图片
    self.factoryImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[[UIImage imageNamed:@"factory.jpg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [self addSubview:self.factoryImageView];
    //logo图片
    self.logoImageView = [XXYSubViewsTool xxyLoginImageViewToolWithImage:[[UIImage imageNamed:@"logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.logoImageView.layer.cornerRadius = 40 * kViewWidthScale;
    self.logoImageView.layer.masksToBounds = YES;
    [self addSubview:self.logoImageView];
    //星级图片
    self.startsView = [[YXBStarsView alloc] init];
    self.startsView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.startsView];
    
    [self layoutSubeviewsHandler];
}
/**
 *  布局控件
 */
- (void)layoutSubeviewsHandler{
    weakify(self)
    CGFloat factoryImageH = self.frame.size.height * 2 / 3;
    [self.factoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.mas_top);
        make.left.equalTo(weak_self.mas_left);
        make.right.equalTo(weak_self.mas_right);
        make.height.mas_equalTo(factoryImageH);
    }];
    //logo图片
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.mas_equalTo(weak_self.mas_top).with.offset();
        make.centerX.equalTo(weak_self.mas_centerX);
        //make.centerY.equalTo(weak_self.mas_centerY);
        make.top.mas_equalTo(weak_self.factoryImageView.mas_bottom).with.offset(-40);
        make.size.mas_equalTo(CGSizeMake(80 * kViewWidthScale, 80 * kViewWidthScale));
    }];
    //星星
    [self.startsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weak_self.logoImageView.mas_bottom).with.offset(2);
        make.centerX.mas_equalTo(weak_self.mas_centerX);
        make.bottom.mas_equalTo(weak_self.mas_bottom);
        make.width.mas_equalTo(120 * kViewWidthScale);
        //make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}
/**
 *  更新图片数据
 */
- (void)updataWithModel{
    //[self.startsView setLeveal:5.0];
}

@end
