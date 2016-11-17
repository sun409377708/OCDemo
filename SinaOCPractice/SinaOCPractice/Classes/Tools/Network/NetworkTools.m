//
//  NetworkTools.m
//  OC网络框架封装
//
//  Created by maoge on 16/11/13.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "NetworkTools.h"

@protocol HTTPProxy <NSObject>

@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                  uploadProgress:(nullable void (^)(NSProgress *uploadProgress)) uploadProgress
                                downloadProgress:(nullable void (^)(NSProgress *downloadProgress)) downloadProgress
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@interface NetworkTools ()<HTTPProxy>



@end

@implementation NetworkTools

+ (instancetype)sharedTools {
    
    static NetworkTools *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
        //支持html/text格式
//        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"text/plain"]];

    });
    
    return instance;
}

//第二层封装
- (void)request:(HTTPMethod)mothod urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id responseObject, NSError *error))finished {
    
    
    void(^successCallback)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        finished(responseObject, nil);
    };
    
    void (^failCallBack)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        finished(nil, error);
        
    };
    
    //子类动态调用父类方法
    NSString *methodname = (mothod == GET) ? @"GET" : @"POST";

    [[self dataTaskWithHTTPMethod:methodname URLString:urlString parameters:parameters uploadProgress:nil downloadProgress:nil success:successCallback failure:failCallBack] resume];
}


/*
- (void)request:(HTTPMethod)mothod urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id responseObject, NSError *error))finished {
 
 
    void(^successCallback)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) = ^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        finished(responseObject, nil);
    };
    
    void (^failCallBack)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) = ^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        finished(nil, error);

    };
    
    if (mothod == GET) {
        
        [self GET:urlString parameters:parameters progress:nil success:successCallback failure:failCallBack];
    }else {
        
        [self POST:urlString parameters:parameters progress:nil success:successCallback failure:failCallBack];
    }
    
}
*/
 
@end
