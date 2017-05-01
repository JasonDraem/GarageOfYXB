//
//  XXYKeyBoardManager.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/18.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYKeyBoardManager.h"

@interface XXYKeyBoardManager ()
@property (nonatomic) CGFloat keyboardHeight;
@property (nonatomic) NSTimeInterval duration;
@property (nonatomic) BOOL isKeyboardHiden;
@end

@implementation XXYKeyBoardManager
- (void)addObserver {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(keyboardWillChangeFrameAction:)
                   name:UIKeyboardWillChangeFrameNotification
                 object:nil];
    [center addObserver:self
               selector:@selector(keyboardWillHideAction:)
                   name:UIKeyboardWillHideNotification
                 object:nil];
    [center addObserver:self
               selector:@selector(keyboardWillShowAction:)
                   name:UIKeyboardWillShowNotification
                 object:nil];
}

- (void)removeObserver {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark -
- (CGFloat)keyboardHeightWith:(NSNotification *)notify {
    return [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
}

- (NSTimeInterval)durationWith:(NSNotification *)notify {
    return [[notify.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
}

- (void)keyboardWillChangeFrameAction:(NSNotification *)notify {
    CGFloat breforeKeyboardHeight = self.keyboardHeight;
    self.keyboardHeight = [self keyboardHeightWith:notify];
    self.duration = [self durationWith:notify];
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(keyboardWillChangeFrameActionBefore:newHeight:duration:)]) {
        [self.delegate keyboardWillChangeFrameActionBefore:breforeKeyboardHeight
                                                 newHeight:self.keyboardHeight
                                                  duration:self.duration];
    }
}

- (void)keyboardWillHideAction:(NSNotification *)notify {
    self.keyboardHeight = [self keyboardHeightWith:notify];
    self.duration = [self durationWith:notify];
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(keyboardWillHideAction:duration:)]) {
        [self.delegate keyboardWillHideAction:self.keyboardHeight duration:self.duration];
    }
}

- (void)keyboardWillShowAction:(NSNotification *)notify {
    self.keyboardHeight = [self keyboardHeightWith:notify];
    self.duration = [self durationWith:notify];
    if (self.delegate &&
        [self.delegate respondsToSelector:@selector(keyboardWillShowAction:duration:)]) {
        [self.delegate keyboardWillShowAction:self.keyboardHeight duration:self.duration];
    }
}


- (CGFloat)keyboardCoveredView:(UIView *)view {
    //将视图投影到Windows上
    CGRect rect = [view convertRect:view.bounds toView:[UIApplication sharedApplication].keyWindow];
    return [self keyboardCoveredRect:rect];
}

- (CGFloat)keyboardCoveredRect:(CGRect)rect {
    CGFloat spaceToBottom = CGRectGetHeight([[UIScreen mainScreen] bounds]) - CGRectGetMaxY(rect);
    return self.keyboardHeight - spaceToBottom;
}

@end

@implementation UIView (MoveUp)

- (void)moveUpAnimateWithDuration:(NSTimeInterval)duration space:(CGFloat)space {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.frame;
        frame.origin.y += space;
        self.frame = frame;
    }];
}

@end
