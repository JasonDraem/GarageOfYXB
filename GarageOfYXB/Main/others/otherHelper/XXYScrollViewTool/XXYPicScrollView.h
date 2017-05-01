//
//  XXYPicScrollView.h
//  GarageOfYXB
//
//  Created by Jason_Xu on 16/9/27.
//  Copyright © 2016年 JasonXu. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  小球位置
 */
typedef NS_ENUM(NSUInteger, PageControlStyle) {
    /**
     *  中间
     */
    PageControlAtCenter = 0,
    /**
     *  右侧
     */
    PageControlAtRight = 1,
};

@interface XXYPicScrollView : UIView
//占位图片
@property (nonatomic,strong) UIImage *placeImage;

@property (nonatomic,assign) NSTimeInterval AutoScrollDelay; //default is 2.0f,如果小于0.5不自动播放

//设置PageControl位置
@property (nonatomic,assign) PageControlStyle style; //default is PageControlAtCenter

@property (nonatomic,copy) NSArray<NSString *> *titleData; //设置后显示label,自动设置PageControlAtRight

//图片被点击会调用该block
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(NSInteger index); //index从0开始
@property (nonatomic,strong) UIColor *pageIndicatorTintColor;

@property (nonatomic,strong) UIColor *currentPageIndicatorTintColor;

//default is [[UIColor alloc] initWithWhite:0.5 alpha:1]
@property (nonatomic,strong) UIColor *textColor;

@property (nonatomic,strong) UIFont *font;

/*@parameter imageUrl
 imageUrlString或imageName
 网络加载urlsring必须为http:// 开头,
 //本地加载只需图片名字数组
 */
/**
 *  初始化滚动视图
 *
 *  @param frame    frame
 *  @param imageUrl 图片url
 *
 *  @return <#return value description#>
 */
+ (instancetype)picScrollViewWithFrame:(CGRect)frame WithImageUrls:(NSArray<NSString *> *)imageUrl;

@end
