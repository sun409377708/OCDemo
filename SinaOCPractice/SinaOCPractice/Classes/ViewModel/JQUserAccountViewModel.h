//
//  JQUserAccountViewModel.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JQUserAccount.h"


@interface JQUserAccountViewModel : NSObject

@property (nonatomic, strong) JQUserAccount *userAccount;

//判断是否登陆
@property (nonatomic, assign) BOOL isUserLogin;

+ (instancetype)shared;

- (void)loadAccessToken:(NSString *)code finished:(void(^)(BOOL isSuccess))finished ;
@end
