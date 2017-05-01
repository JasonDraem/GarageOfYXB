//
//  UIScrollView+ScalableCover.h
//  LetYourHeartTraveling
//
//  Created by JasonXu on 16/4/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>

//(数字随意订)
static const CGFloat MaxHeight = 200;

@interface ScalableCover : UIImageView
//
@property (nonatomic, strong) UIScrollView *XXYScrollView;

@end
/**
 *  Description
 */
@interface UIScrollView (ScalableCover)
/**
 *  可伸缩覆盖物
 */
@property (nonatomic, weak) ScalableCover *XXYScalableCover;
/**
 *  添加放大照片
 *
 *  @param image
 */
- (void)addScalableCoverWithImage:(UIImage *)image;
/**
 *  移除可放大的覆盖物
 */
- (void)removeScalableCover;



@end
