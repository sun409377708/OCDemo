//
//  UIBarButtonItem+Addition.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "UIBarButtonItem+Addition.h"

@implementation UIBarButtonItem (Addition)

- (instancetype)initWithCustomTitle:(NSString *)title imageName:(NSString *)image target:(id)target action:(SEL)action {
    
    if ([self init]) {
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:title forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", image]] forState:UIControlStateHighlighted];
        
        [btn sizeToFit];
        
        //添加点击事件
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        self = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }

    return self;
}

@end
