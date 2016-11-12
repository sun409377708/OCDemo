//
//  UIBarButtonItem+Addition.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Addition)


- (instancetype)initWithCustomTitle:(NSString *)title imageName:(NSString *)image target:(id)target action:(SEL)action;

@end
