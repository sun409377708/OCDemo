//
//  UIButton+Extension.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (instancetype)initWithTitle:(NSString *)title image:(NSString *)image BackImage:(NSString *)backImage Color:(UIColor *)color FontSize:(CGFloat)size {
    
    if (self = [super init]) {
        
        [self setTitle:title forState:UIControlStateNormal];
        if (color != nil) {
            [self setTitleColor:color forState:UIControlStateNormal];
        }
        if (backImage != nil) {
            [self setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
            [self setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", backImage]] forState:UIControlStateHighlighted];
            
        }
        if (size != 0) {
            self.titleLabel.font = [UIFont systemFontOfSize:size];
            
        }
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        
    }
    
    return self;
}

@end
