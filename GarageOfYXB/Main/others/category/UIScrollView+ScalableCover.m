//
//  UIScrollView+ScalableCover.m
//  LetYourHeartTraveling
//
//  Created by JasonXu on 16/4/28.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import "UIScrollView+ScalableCover.h"
#import <objc/runtime.h>

//
static NSString * const KContentOffset = @"contentOffset";
static NSString * const KScalableCover = @"scalableCover";

@implementation UIScrollView (ScalableCover)
//
- (void)setXXYScalableCover:(ScalableCover *)XXYScalableCover{
    //
    [self willChangeValueForKey:KScalableCover];
    //
    objc_setAssociatedObject(self, @selector(scalableCover), XXYScalableCover, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:KScalableCover];
}
//
- (ScalableCover *)scalableCover{
    return objc_getAssociatedObject(self, &KScalableCover);
}
//
- (void)addScalableCoverWithImage:(UIImage *)image{
    
    ScalableCover *cover = [[ScalableCover alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, MaxHeight)];
    //
    cover.backgroundColor = [UIColor lightTextColor];
    cover.image = image;
    cover.XXYScrollView = self;
    //
    [self addSubview:cover];
    [self sendSubviewToBack:cover];
    //
    self.XXYScalableCover = cover;
}
//
- (void)removeScalableCover{
    [self.XXYScalableCover removeFromSuperview];
    //
    self.XXYScalableCover = nil;
}

@end

//
@interface ScalableCover (){
    
}
@end
/**
 *  Description
 */
@implementation ScalableCover

- (instancetype) initWithFrame:(CGRect)frame{
    //
    if (self = [super initWithFrame:frame]) {
        //
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
    }
    return self;
}
//
- (void)setXXYScrollView:(UIScrollView *)XXYScrollView{
    //
    [_XXYScrollView removeObserver:XXYScrollView forKeyPath:KContentOffset];
    //
    _XXYScrollView = XXYScrollView;
    //
    [_XXYScrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
//
- (void)removeFromSuperview{
    //
    [_XXYScrollView removeObserver:self forKeyPath:@"contentOffset"];
    //
    [super removeFromSuperview];
}
/**
 *  Description
 */
- (void)layoutSubviews{
    //
    [super layoutSubviews];
    //
    if (self.XXYScrollView.contentOffset.y < 0) {
        CGFloat offset = - self.XXYScrollView.contentOffset.y;
        //
        self.frame = CGRectMake(- offset, - offset, _XXYScrollView.bounds.size.width + offset * 2, MaxHeight + offset);
    }else{
        self.frame = CGRectMake(0, 0, _XXYScrollView.bounds.size.width, MaxHeight);
    }
}
//
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self setNeedsLayout];
}
@end
















