//
//  NSObject+JQRuntime.h
//  运行时
//
//  Created by maoge on 16/10/24.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JQRuntime)

/**
 * 将 `字典数组` 转换成当前模型的对象数组
 *
 * @param array 字典数组
 *
 * @return 模型对象数组
 */
+ (NSArray *)jq_objectsWithArray:(NSArray *)array;


/**
 * 返回当前类的所有属性
 *
 * @return 属性名称数组
 */
+ (NSArray *)jq_propertyList;


/**
 * 返回当前类的所有成员变量的属性
 *
 * @return 成员变量的数组
 */
+ (NSArray *)jq_ivarList;
@end
