//
//  JQUserAccountViewModel.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQUserAccountViewModel.h"
#import "JQUserAccount.h"


@implementation JQUserAccountViewModel


+ (instancetype)shared {
    
    static JQUserAccountViewModel *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //沙盒取值
        self.userAccount = [self loadUserInfo];
    }
    return self;
}


- (BOOL)isUserLogin {
    
    if (self.userAccount.access_token != nil && [self isExpires] == NO) {
        return  YES;
    }
    return  NO;
}

- (BOOL)isExpires {
    
    NSDate *expireDate = self.userAccount.expiresDate;
    NSDate *nowDate = [NSDate date];
    
    if ([expireDate compare:nowDate] == NSOrderedDescending) {
        return NO;
    }
    
    return  YES;
}

- (void)loadAccessToken:(NSString *)code finished:(void(^)(BOOL isSuccess))finished {
    
    NSString *urlString = @"https://api.weibo.com/oauth2/access_token";
    
    NSDictionary *parameter = @{@"client_id": client_id,
                                @"client_secret":client_secret,
                                @"grant_type" : @"authorization_code",
                                @"code":code,
                                @"redirect_uri":redirect_uri};
    
    [[NetworkTools sharedTools] request:POST urlString:urlString parameters:parameter finished:^(id responseObject, NSError *error) {
        
        if (error != nil) {
            finished(NO);
            return;
        }
        
        NSDictionary *dict = responseObject;
        
        [self loadUserInfo:dict finished:finished];
        
    }];
    
}

- (void)loadUserInfo:(NSDictionary *)dict finished:(void(^)(BOOL isSuccess))finished {
    
    NSString *urlString = @"https://api.weibo.com/2/users/show.json";
    NSDictionary *parameter = @{@"access_token" : dict[@"access_token"],
                                @"uid" : dict[@"uid"]};
    
    
    [[NetworkTools sharedTools] request:GET urlString:urlString parameters:parameter finished:^(id responseObject, NSError *error) {
        
        if (error != nil) {
            finished(NO);
            return;
        }
        
        NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithDictionary:responseObject];
        
                //遍历字典
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {

            [dictM setObject:value forKey:key];
        }];
        
        //字典转模型
        JQUserAccount *userAccount = [[JQUserAccount alloc] initWithDict:dictM.copy];
        
        //保存数据
        [self saveUserInfo:userAccount];
        
        //给当前userAccount属性赋值
        self.userAccount = userAccount;
        
        //回调数据
        finished(YES);
        
        
    }];
}

- (void)saveUserInfo:(JQUserAccount *)userAccount{
    NSLog(@"%@", kUsersInfoPath);
    [NSKeyedArchiver archiveRootObject:userAccount toFile:kUsersInfoPath];
}

- (JQUserAccount *)loadUserInfo {
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:kUsersInfoPath];
    
}

@end
