//
//  NetworkTools.h
//  OC网络框架封装
//
//  Created by maoge on 16/11/13.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <AFNetworking.h>

typedef enum : NSUInteger {
    GET,
    POST,
} HTTPMethod;

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;

- (void)request:(HTTPMethod)mothod urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id responseObject, NSError *error))finished;

@end
