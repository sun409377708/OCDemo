//
//  SinaOCPractice_PrefixHeader.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#if __OBJC__

#import <Masonry.h>
#import "KYAdditions.h"
#import "CommonDefine.h"
/**
 * 调试的宏
 */
#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif
