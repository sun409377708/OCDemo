//
//  JQWelcomeViewController.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/17.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQWelcomeViewController.h"

@interface JQWelcomeViewController ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *welLabel;

@end

@implementation JQWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setupUI];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self startAnimation];
}

- (void)startAnimation {
    
    [_iconView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).offset(-80);
    }];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:6 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.6 animations:^{
            
            self.welLabel.alpha = 1;
        } completion:^(BOOL finished) {
            
            //切换控制器
            [[NSNotificationCenter defaultCenter] postNotificationName:kChangeRootViewControllerNotification object:@"welcome"];
        }];
    }];
}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor colorWithWhite:235 / 255.0 alpha:1];
    
    [self.view addSubview:self.iconView];
    [self.view addSubview:self.welLabel];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(80);
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [_welLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(_iconView.mas_bottom).offset(16);
    }];
}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_default_big"]];
        
        _iconView.layer.cornerRadius = 45;
        _iconView.layer.masksToBounds = YES;
    }
    return _iconView;
}

- (UILabel *)welLabel {
    if (!_welLabel) {
        
        _welLabel = [UILabel labelWithTitle:@"欢迎归来" andColor:[UIColor darkGrayColor] andFontSize:14];
        _welLabel.alpha = 0;
    }
    return _welLabel;
}

@end
