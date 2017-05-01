//
//  XXYAFNetRequestManager.h
//  XXYSoundRecorder
//
//  Created by Jason_Xu on 16/9/13.
//  Copyright © 2016年 Jason_Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  请求数据block回调
 *
 *  @param id    <#id description#>
 *  @param error <#error description#>
 */
typedef void(^httpRequestSuccessBlock)(id, NSError *error);
typedef void(^httpRequestFailureBlock)(id, NSError *error);

/**
 *  上传数据block回调
 */
typedef void(^uploadSuccessBlock)(id, NSError *error);
typedef void(^uploadFailedBlock)(id, NSError *error);
typedef void(^uploadProgress)(NSProgress *progress);

@interface XXYAFNetRequestManager : NSObject
/**
 *  单例
 *
 *  @return <#return value description#>
 */
+ (instancetype)shareInstance;
#pragma mark - 请求数据相关
/**
 *  af post请求
 *
 *  @param urlStr       接口字符串
 *  @param paramers     参数
 *  @param successBlock 成功后的回调
 *  @param failedBlock  失败后的回调
 */
- (void)xxyPost:(NSString *)urlStr
        paramerters:(id)para
        success:(httpRequestSuccessBlock)successBlock
           fail:(httpRequestFailureBlock)failedBlock;
/**
 *  get 请求
 *
 *  @param urlStr       接口
 *  @param paramers     参数
 *  @param successBlock get成功后的回调
 *  @param failedBlock  失败后的回调
 */
- (void)xxyGet:(NSString *)urlStr
      paramerters:(id)para
       success:(httpRequestSuccessBlock)successBlock
          fail:(httpRequestFailureBlock)failedBlock;

#pragma mark - 上传数据相关
/**
 *  上传图片
 *
 *  @param urlStr       请求地址
 *  @param para         请求参数
 *  @param images       图片数组
 *  @param name         文件对应服务器上的字段
 *  @param fileName     文件名
 *  @param mimeType     图片文件的类型 例如：png，jpeg（默认类型）
 *  @param progress     上传进度
 *  @param successBlock 请求成功后的回调
 *  @param failBlock    请求失败后的回调
 */
- (void)xxyUploadWithUrlStr:(NSString *)urlStr
                 parameters:(id)para
                 imageArray:(NSArray<UIImage *> *)images
                       name:(NSString *)name
                   fileName:(NSString *)fileName
                   mimeType:(NSString *)mimeType
                   progress:(uploadProgress)progress
                    success:(uploadSuccessBlock)successBlock
                       fail:(uploadFailedBlock)failBlock;

#pragma mark - 监听网络状态
/**
 *  网络状态监管
 */
- (void)xxyStartMonitoring;














































@end
