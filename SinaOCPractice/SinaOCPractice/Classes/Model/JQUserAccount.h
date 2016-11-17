//
//  JQUserAccount.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/15.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JQUserAccount : NSObject<NSCoding>

@property (nonatomic, copy) NSString *access_token;

@property (nonatomic, assign) NSInteger expires_in;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avatar_large;

@property (nonatomic, strong) NSDate *expiresDate;

- (instancetype)initWithDict:(NSDictionary *)dict;


@end
