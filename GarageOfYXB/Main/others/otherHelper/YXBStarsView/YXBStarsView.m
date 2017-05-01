//
//  YXBStarsView.m
//  YXBCustomerSoftWare
//
//  Created by Jason_Xu on 16/9/24.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "YXBStarsView.h"
#import <Masonry/Masonry.h>

#define YXBStarsView_WIDTH   100
//(float)(self.frame.size.width)
#define YXBStarsView_HEIGHT  16
//(float)(self.frame.size.height)

@interface YXBStarsView ()

@property (nonatomic, strong) UIImageView *foregroundView;
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) UIView *clipView;

@end

@implementation YXBStarsView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //[self customeViews];
        //self.backgroundColor = [UIColor greenColor];
        [self createUISubviews];
    }
    return self;
}

#pragma mark - 星级评价第一种方式
- (void)customeViews {
    UIImageView *backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 65, 23)];
    backgroundView.image = [[UIImage imageNamed:@"StarsBackground"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addSubview:backgroundView];
    
    self.foregroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.foregroundView.contentMode = UIViewContentModeLeft;
    self.foregroundView.clipsToBounds = YES;
    self.foregroundView.image = [[UIImage imageNamed:@"StarsForeground"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addSubview:self.foregroundView];
}

- (void)setLeveal:(double)leveal {
    _foregroundView.frame = CGRectMake(0, 0, 65*(leveal/5.00), 23);
}


#pragma mark - 星级评价第二种方式
- (void)createUISubviews{
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(5 * kViewWidthScale, 2, YXBStarsView_WIDTH, YXBStarsView_HEIGHT)];
    NSLog(@"%@", NSStringFromCGRect(self.bottomView.frame));
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bottomView];
    [self addImageViewWithImage:@"start_normal.png" superView:self.bottomView];
    
    self.clipView = [[UIView alloc] initWithFrame:CGRectMake(5 *kViewWidthScale, 2, 0, YXBStarsView_HEIGHT)];
    self.clipView.backgroundColor = [UIColor clearColor];
    self.clipView.clipsToBounds = YES;
    [self addSubview:self.clipView];
    [self addImageViewWithImage:@"start_selected.png" superView:self.clipView];
}

- (void)addImageViewWithImage:(NSString *)image superView:(UIView *)superView{
    CGFloat margin = (YXBStarsView_WIDTH - YXBStarsView_HEIGHT * 5) / 4;
    for (NSInteger i = 0; i < 5; i ++) {
        self.foregroundView = [[UIImageView alloc] initWithFrame:CGRectMake((margin + YXBStarsView_HEIGHT) * i, 0, YXBStarsView_HEIGHT, YXBStarsView_HEIGHT)];
        self.foregroundView.image = [UIImage imageNamed:image];
        [superView addSubview:self.foregroundView];
    }
}

- (void)layoutSubviewsWithMasonry{
    weakify(self)
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerX.mas_equalTo(weak_self.mas_centerX);
        make.right.mas_equalTo(weak_self.mas_right).with.offset(5);
        make.top.mas_equalTo(weak_self.mas_top);
        make.size.mas_equalTo(CGSizeMake(YXBStarsView_WIDTH, YXBStarsView_HEIGHT));
    }];
    //
    [self.clipView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weak_self.mas_right).with.offset(5);
        make.top.mas_equalTo(weak_self.mas_top);
        make.size.mas_equalTo(CGSizeMake(0, YXBStarsView_HEIGHT));
    }];
}

- (void)setStartProgress:(double)level{
    CGRect clipFrame = self.clipView.frame;
    clipFrame.size.width = YXBStarsView_WIDTH * (level / 5);
    self.clipView.frame = clipFrame;
}

@end
