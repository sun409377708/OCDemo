//
//  JQMainTabBar.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQMainTabBar.h"

@interface JQMainTabBar ()

@property (nonatomic, strong) UIButton *composeBtn;
@end

@implementation JQMainTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
        
    [self addSubview:self.composeBtn];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width / 5;
    CGFloat h = self.bounds.size.height;
    
    NSInteger index = 0;

    for (UIView *subView in self.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            subView.frame = CGRectMake(index * w, 0, w, h);
            
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
    
    //布局composeButton
    self.composeBtn.size = CGSizeMake(w, h);
    self.composeBtn.center = CGPointMake(self.center.x, self.bounds.size.height * 0.5);    
}

- (UIButton *)composeBtn {
    
    if (_composeBtn == nil) {
        
        _composeBtn = [[UIButton alloc] init];
        
        
        [_composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_composeBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        [_composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_composeBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [_composeBtn sizeToFit];
        
    }
    
    return _composeBtn;
}

@end
