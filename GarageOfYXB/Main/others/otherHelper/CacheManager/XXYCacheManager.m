//
//  XXYCacheManager.m
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/14.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import "XXYCacheManager.h"

@interface XXYCacheManager ()



@end

@implementation XXYCacheManager

+ (instancetype)shareInstance{
    static XXYCacheManager *_shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[XXYCacheManager alloc] init];
    });
    return _shareInstance;
}
/**
 *  返回文件大小
 *
 *  @param filePath <#filePath description#>
 *
 *  @return <#return value description#>
 */
- (long long) fileSizeAtPath:(NSString*)filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}
/**
 *  遍历文件夹获得文件夹大小，返回多少M
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 文件大小
 */
- (float)folderSizeAtPath:(NSString*)folderPath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0 * 1024.0);
}
// 清除缓存
- (void)clearFileMemory{
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(globalQueue, ^{
        
        NSString *cachPath = DocumentPath;
        //缓存
        //NSString *fileSize = [NSString stringWithFormat:@"缓存已清除%.1fM", [self folderSizeAtPath:cachPath]];
        self.fileCount = [self folderSizeAtPath:cachPath];
        //缓存文件路径
        NSLog(@"cachPath :%@", cachPath);
        
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
        
        //NSLog(@"files :%zd",[files count]);
        
        for (NSString *p in files) {
            
            NSError *error;
            
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
                
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            }
        }
        
        [self performSelectorOnMainThread:@selector(clearCacheSuccess:) withObject:nil waitUntilDone:YES];});
}
/**
 *  清除成功
 */
- (void)clearCacheSuccess:(CGFloat)fileSize{
    if (self.clearCacheDelegate && [self.clearCacheDelegate respondsToSelector:@selector(clearDiskMemoryFile:)]) {
        [self.clearCacheDelegate clearDiskMemoryFile:fileSize];
        //fileSize = self.fileCount;
    }
}

@end
