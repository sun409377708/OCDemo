//
//  NSObject+JQRuntime.m
//  运行时
//
//  Created by maoge on 16/10/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "NSObject+JQRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (JQRuntime)

+ (NSArray *)jq_objectsWithArray:(NSArray *)array {

    // 1. 数量判断
    if (array.count == 0) {
        return nil;
    }
    
    // 2. 判断是否是字典的数组
    NSAssert([array[0] isKindOfClass:[NSDictionary class]], @"必须传入字典的数组");
    
    // 3. 获取属性列表数组
    NSArray *list = [self jq_propertyList];
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    // 4. 循环遍历数组
    for (NSDictionary *dict in array) {
        
        // 1 > 创建模型
        id model = [self new];
        
        // 2> 字典转模型
        
        for (NSString *key in dict) {
            // 判断 key 是否包含在当前类的属性列表中，这句省去setValueForUndefineKey
            if ([list containsObject:key]) {
                [model setValue:dict[key] forKey:key];
            }
        }
        // 3 > 添加到数组
        [arrM addObject:model];
    }
    
    return arrM.copy;
}

const void *propertyListKey = @"propertyListKey";

+ (NSArray *)jq_propertyList {
    
    // 0. --- 判断属性数组是否存在，如果存在直接返回 `属性数组对象` ---
    NSArray *result = objc_getAssociatedObject(self, propertyListKey);
    
    if (result != nil) {
        return result;
    }
    
    // 1. 获取属性数组
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性数量 %u", count);
    
    NSMutableArray *arrM = [NSMutableArray array];
    // 2. 遍历数组
    for (unsigned int i = 0; i < count; i++) {
        
        // 1> 通过下标获取属性对象
        objc_property_t property = list[i];
        
        // 2> 获取属性的名称
        const char *pty = property_getName(property);
        
        // 3> 转换成 OC 的字符串
        NSString *str = [NSString stringWithUTF8String:pty];
        
        [arrM addObject:str];
    }
    
    //释放数组
    free(list);
    
    // --- 保存属性数组对象 ---
    objc_setAssociatedObject(self, propertyListKey, arrM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return arrM.copy;
}

+ (NSArray *)jq_ivarList {
    
    // 1. 取类的成员变量列表
    unsigned int count = 0;
    Ivar *list = class_copyIvarList([self class], &count);
    
    // NSLog(@"%u", count);
    NSMutableArray *arrayM = [NSMutableArray array];
    
    // 2. 遍历数组
    for (unsigned int i = 0; i < count; i++) {
        
        // 1> 根据下标获取成员变量
        Ivar ivar = list[i];
        
        // 2> 取 ivar 的名字
        const char *cName = ivar_getName(ivar);
        
        // 3> 转换成 NSString
        NSString *name = [NSString stringWithUTF8String:cName];
        
        [arrayM addObject:name];
    }
    
    // 3. 释放列表
    free(list);
    
    return arrayM.copy;
}

@end
