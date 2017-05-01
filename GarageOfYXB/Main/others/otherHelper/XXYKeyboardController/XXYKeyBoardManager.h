//
//  XXYKeyBoardManager.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/18.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XXYKeyboardControllerDelegate <NSObject>

@optional;
/**
 *  键盘将要改变frame
 *
 *  @param changedHeight 键盘的高度
 *  @param duration      动画时间
 */
- (void)keyboardWillHideAction:(CGFloat)keyboardHeight duration:(NSTimeInterval)duration;

/**
 *  键盘将要改变frame
 *
 *  @param changedHeight 键盘的高度
 *  @param duration      动画时间
 */
- (void)keyboardWillShowAction:(CGFloat)keyboardHeight duration:(NSTimeInterval)duration;

/**
 *  <#Description#>
 *
 *  @param beforeHeight <#beforeHeight description#>
 *  @param newHeight    <#newHeight description#>
 *  @param duration     <#duration description#>
 */
- (void)keyboardWillChangeFrameActionBefore:(CGFloat)beforeHeight
                                  newHeight:(CGFloat)newHeight
                                   duration:(NSTimeInterval)duration;

@end


@interface XXYKeyBoardManager : NSObject
/**
 *  键盘高度
 */
@property (nonatomic, readonly) CGFloat keyboardHeight;

/**
 *  动画时间
 */
@property (nonatomic, readonly) NSTimeInterval duration;

@property (nonatomic, weak) id <XXYKeyboardControllerDelegate> delegate;

- (void)addObserver;
- (void)removeObserver;

/**
 *  判断view是否被键盘覆盖
 *
 *  @param 需要判断的视图
 *
 *  @return 被键盘覆盖的高度; >0,被键盘覆盖 <0没有被键盘覆盖
 */
- (CGFloat)keyboardCoveredView:(UIView *)view;

/**
 *  判断rect是否被键盘覆盖
 *
 *  @param rect 需要判断
 *
 *  @return 被键盘覆盖的高度; >0,被键盘覆盖 <0没有被键盘覆盖
 */
- (CGFloat)keyboardCoveredRect:(CGRect)rect;

@end

@interface UIView (MoveUp)
/**
 *  将self.view向上移动
 *
 *  @param duration 动画时间
 *  @param space    移动距离; >0 向上; <0 向下;
 */
- (void)moveUpAnimateWithDuration:(NSTimeInterval)duration space:(CGFloat)space;


@end
