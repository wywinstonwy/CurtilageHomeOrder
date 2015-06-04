//
//  BaseNetWork.m
//  WYAFNETWork2.0
//
//  Created by WangYun on 15-1-6.
//  Copyright (c) 2015年 WangYun. All rights reserved.
//

#import "BaseNetWork.h"
#import "AFNetworking.h"


@implementation BaseNetWork
+(id)shareManager
{
    static BaseNetWork *shareNet = nil;
    static dispatch_once_t predicate ;
    dispatch_once(&predicate, ^{
        shareNet = [[BaseNetWork alloc] init];
    });
    
    return shareNet;
}
/**
 *  检测设备是否联网
 */
#pragma mark 网络检测
-(NSInteger )reach
{
    __block  NSInteger statate = -1;
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // 局域网络,不花钱
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
  
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        statate = status;
    }];
    return statate;
}
#pragma mark post网络请求
-(id)postRequestWithBaseURLString:(NSString *)urlString
                       parameters:(id)parameter
                        forSucess:(sucessResultBlock)forSucess
                          forFail:(failErrorBlock)forError;
{
    //在向服务端发送请求状态栏显示网络活动标志：
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//     manager.requestSerializer = [AFJSONRequestSerializer serializer];//这个是json解析
   // manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
     manager.responseSerializer = [AFHTTPResponseSerializer serializer];
     manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //NSString *stringURL = [NSString stringWithFormat:@"%@%@",SERVER_URL,urlString];
    NSString *stringURL = [NSString stringWithFormat:@"%@%@",SERVER_URL,urlString];
    [manager POST:stringURL parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求结束状态栏隐藏网络活动标志：
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
      //  NSLog(@"responseObject:%@",responseObject);
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        //系统自带JSON解析
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        forSucess(resultDic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求结束状态栏隐藏网络活动标志：
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        NSLog(@"error:%@",error);
        forError(error);
        
    }];
    
    return manager;
    
}


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
#pragma mark get网络请求
-(id)getRequestWithBaseURLSttring:(NSString *)urlString
                       parameters:(id)parameter
                        forSucess:(sucessResultBlock)forSucess
                          forFail:(failErrorBlock)forError
{
     //在向服务端发送请求状态栏显示网络活动标志：
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //  manager.responseSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];//这个是json解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型

    [manager GET:urlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求结束状态栏隐藏网络活动标志：
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
//        NSLog(@"responseObject:%@",responseObject);
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        //此处过滤所有值为null的情况。
        requestTmp = [requestTmp  stringByReplacingOccurrencesOfString:@":null" withString:@":\"\""];
        
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        //系统自带JSON解析
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        
        forSucess(resultDic);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求结束状态栏隐藏网络活动标志：
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        forError(error);
        
    }];
    
    return manager;

}

#pragma mark 文件上传
-(id)upFileRequestwithBaseURLString:(NSString *)urlString
                           filePath:(NSString *)filePath
                         parameters:(id)paramerter
                          forSucess:(sucessResultBlock)forSucess
                            forFail:(failErrorBlock)forError;
{
    //在向服务端发送请求状态栏显示网络活动标志：
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //     manager.requestSerializer = [AFJSONRequestSerializer serializer];//这个是json解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//设置相应内容类型
    
   // NSString *stringURL = [NSString stringWithFormat:@"%@%@",SERVER_URL,urlString];
    NSString *stringURL = [NSString stringWithFormat:@"%@%@",SERVER_URL,urlString];
    [manager POST:stringURL parameters:paramerter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        [formData appendPartWithFileData:data name:@"" fileName:@"" mimeType:@"image/png"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    return manager;
}


/**
 *  下载功能
 *
 *  @param filePath 下载文件路径
 */
-(void)sessionDownloadWithFilePath:(NSString *)urlString
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    urlString = @"http://pan.baidu.com/download?fr=pinzhuan&ref=PPZQ#pan";
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSProgress *progress;
    NSURLSessionDownloadTask *task = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSString *cacheDir =[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *path = [cacheDir stringByAppendingString:response.suggestedFilename];
        // URLWithString返回的是网络的URL,如果使用本地URL,需要注意
        NSURL *fileURL1 = [NSURL URLWithString:path];
        NSURL *fileURL = [NSURL fileURLWithPath:path];
        NSLog(@"== %@ ||%@", fileURL1, fileURL);
        NSLog(@"progress%@",progress);
        return fileURL;
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@ %@", filePath, error);
    }];
    
    [task resume];

}
@end
