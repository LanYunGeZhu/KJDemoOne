//
//  VC9.m
//  KuangJia1
//
//  Created by MrSong on 17/7/31.
//  Copyright © 2017年 LanYunKeJi. All rights reserved.
//

#import "VC9.h"
#import <PGNetworkHelper.h>

@interface VC9 ()

@end

@implementation VC9

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网络请求类" ;
    
    /*
     * PINCache做为AFNetworking缓存层，将AFNetworking请求的数据缓存起来,支持取消当前网络请求，以及取消所有的网络请求，除了常用的Get，Post方法，也将上传图片以及下载文件进行了封装，使用方法及其简单。
     
     PGNetworkHelper屏蔽了AFNetworking自带的缓存，并将PINCache缓存的key也用MD5加密，确保数据的安全。
     支持同步请求
     AFNetworking本身就带有缓存策略，为什么要使用PINCache作为缓存呢？
     
     第一，经过测试PINCache缓存比AFNetworking自带的缓存要快。
     第二，PINCache是将缓存数据进行了加密，更加安全。
     */
    
    //用法详解
    [self pgnetworkUsage];
}

- (void)pgnetworkUsage{
    
    //设置baseURL(必须要设置)
    [PGNetAPIClient baseUrl:@"这里写接口地址前半段"];
    //设置SSL(加密协议)
    [PGNetAPIClient policyWithPinningMode:(AFSSLPinningModeNone)];
    //设置缓存路径 备注:多用户一般用userid来保存每个用户的缓存数据
    [PGNetworkCache pathName:@"这里一般写userid作为缓存路径"];
    
    //GET请求 备注:只需把cache设置为ture即可自动缓存
    [PGNetworkHelper GET:@"url" parameters:nil cache:true responseCache:nil success:^(id responseObject) {
        
        //请求成功需要做的操作在这写
    } failure:^(NSError *error) {
        //请求失败
    }];
    
    //POST请求
    [PGNetworkHelper POST:@"url" parameters:nil cache:false responseCache:^(id responseCache) {
        
        //响应缓存
        NSLog(@"responseCache = %@", responseCache);
    } success:^(id responseObject) {
        
        
    } failure:^(NSError *error) {
        
    }];
    
    //如果需要将数据先进行处理，然后在缓存也是可以的。
    //cache设置为true
    [PGNetworkHelper GET:@"url" parameters:nil cache:true responseCache:^(id responseCache) {
        NSLog(@"responseCache = %@", responseCache);
    }  success:^(id responseObject) {
        //这里进行要缓存的数据，cacheKey就是url，如果有参数的话，就把参数拼接到cacheKey后面，下次就可以直接在responseCache block里面获取了
        [PGNetworkCache saveResponseCache:responseObject forKey:@""];
    } failure:^(NSError *error) {
        NSLog(@"error = %@", error);
    }];
    
    //取消当前的网络请求
    NSURLSessionTask *task = [PGNetworkHelper GET:@"url" parameters:nil cache:true responseCache:nil success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
    [task cancel];
    //取消所有的网络请求
    [PGNetworkHelper cancelAllOperations];
    
//    /**
//     *  上传图片文件
//     *
//     *  @param URL        请求地址
//     *  @param parameters 请求参数
//     *  @param images     图片数组
//     *  @param name       文件对应服务器上的字段
//     *  @param fileName   文件名
//     *  @param mimeType   图片文件的类型,例:png、jpeg(默认类型)....
//     *  @param progress   上传进度信息
//     *  @param success    请求成功的回调
//     *  @param failure    请求失败的回调
//     *
//     *  @return 返回的对象可取消请求,调用cancle方法
//     */
//    + (__kindof NSURLSessionTask *)uploadWithURL:(NSString *)URL
//parameters:(NSDictionary *)parameters
//images:(NSArray<UIImage *> *)images
//name:(NSString *)name
//fileName:(NSString *)fileName
//mimeType:(NSString *)mimeType
//progress:(HttpProgress)progress
//success:(HttpRequestSuccess)success
//failure:(HttpRequestFailed)failure;
//    
//    /**
//     *  下载文件
//     *
//     *  @param URL      请求地址
//     *  @param fileDir  文件存储目录(默认存储目录为Download)
//     *  @param progress 文件下载的进度信息
//     *  @param success  下载成功的回调(回调参数filePath:文件的路径)
//     *  @param failure  下载失败的回调
//     *
//     *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
//     */
//    + (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
//fileDir:(NSString *)fileDir
//progress:(HttpProgress)progress
//success:(void(^)(NSString *filePath))success
//failure:(HttpRequestFailed)failure;
    
    
    //缓存数据
    [PGNetworkCache saveResponseCache:@"CacheObject" forKey:@"cacheKey"];
    //获取缓存数据
    [PGNetworkCache getResponseCacheForKey:@"cacheKey"];
    
    
}


@end
