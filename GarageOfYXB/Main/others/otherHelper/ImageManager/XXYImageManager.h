//
//  XXYImageManager.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/13.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXYImageManager : NSObject
/**
 *  压缩图片（缩放图片）
 *
 *  @param image   <#image description#>
 *  @param newSize <#newSize description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage*)imageWithImageSimple:(UIImage*)image
                    scaledToSize:(CGSize)newSize;
/**
 *  图片压缩方法
 *
 *  @param sourceImage <#sourceImage description#>
 *  @param defineWidth <#defineWidth description#>
 *
 *  @return <#return value description#>
 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage
                        targetWidth:(CGFloat)defineWidth;
/**
 *  存储图像
 *
 *  @param tempImage <#tempImage description#>
 *  @param imageName <#imageName description#>
 */
- (void)saveImage:(UIImage *)tempImage
         withName:(NSString *)imageName;
/**
 *  取照片
 *
 *  @return <#return value description#>
 */
- (NSString *)documentFolderPath;
@end
