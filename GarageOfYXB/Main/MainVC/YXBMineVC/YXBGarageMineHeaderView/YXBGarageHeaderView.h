//
//  YXBGarageHeaderView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/25.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXBStarsView.h"

@interface YXBGarageHeaderView : UIView
/* 维修厂图片 */
@property (nonatomic, strong) UIImageView *factoryImageView;
/* logo图片 */
@property (nonatomic, strong) UIImageView *logoImageView;
/* 星级view */
@property (nonatomic, strong) YXBStarsView *startsView;
/**
 *  更新数据
 */
- (void)updataWithModel;
@end
