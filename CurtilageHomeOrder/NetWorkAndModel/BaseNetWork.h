//
//  BaseNetWork.h
//  WYAFNETWork2.0
//
//  Created by WangYun on 15-1-6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^sucessResultBlock) (id result);
typedef void(^failErrorBlock) (NSError *error);

@interface BaseNetWork : NSObject
+(id)shareManager;
/**
 *  检测设备是否联网
 */
-(NSInteger )reach;
/**
 *  post 请求，传入JSON请求格式
 *
 *  @param urlString urlStirng url地址
 *  @param parameter 传入参数，字典形式
 *  @param forSucess 成功回调
 *  @param forError  失败回调
 *
 *  @return 返回结果
 */
-(id)postRequestWithBaseURLString:(NSString *)urlString
                       parameters:(id)parameter
                        forSucess:(sucessResultBlock)forSucess
                          forFail:(failErrorBlock)forError;


/**
 *  get 请求，
 *
 *  @param urlString urlStirng url地址
 *  @param parameter 传入参数，字典形式
 *  @param forSucess 成功回调
 *  @param forError  失败回调
 *
 *  @return 返回结果
 */
-(id)getRequestWithBaseURLSttring:(NSString *)urlString
                       parameters:(id)parameter
                        forSucess:(sucessResultBlock)forSucess
                          forFail:(failErrorBlock)forError;

/**
 *  文件上传
 *
 *  @param urlString  上传地址
 *  @param filePath   文件路劲
 *  @param paramerter 上传参数
 *  @param forSucess  成功回调
 *  @param forError   失败回调
 *
 *  @return 返回结果
 */
-(id)upFileRequestwithBaseURLString:(NSString *)urlString
                           filePath:(NSString *)filePath
                         parameters:(id)paramerter
                          forSucess:(sucessResultBlock)forSucess
                            forFail:(failErrorBlock)forError;

/**
 *  下载功能
 *
 *  @param filePath 下载文件路径
 */
-(void)sessionDownloadWithFilePath:(NSString *)urlString;
@end
