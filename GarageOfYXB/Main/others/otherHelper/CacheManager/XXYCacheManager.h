//
//  XXYCacheManager.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/14.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XXYClearCacheDelegate <NSObject>
/**
 *  清除文件缓存
 */
- (void)clearDiskMemoryFile:(CGFloat)fileSize;

@end

@interface XXYCacheManager : NSObject

@property (nonatomic, assign) CGFloat fileCount;
//构造代理
@property (nonatomic, weak) id<XXYClearCacheDelegate>clearCacheDelegate;

/**
 *  单例
 *
 *  @return
 */
+ (instancetype)shareInstance;
/**
 *  缓存大小
 *
 *  @param folderPath 缓存路径
 *
 *  @return
 */
- (float)folderSizeAtPath:(NSString*)folderPath;
/**
 *  清除缓存
 */
- (void)clearFileMemory;
@end
