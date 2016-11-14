//
//  JQVisitorView.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQVisitorView.h"

@interface JQVisitorView ()

@property (nonatomic, strong) UIButton *LoginBtn;
@property (nonatomic, strong) UIButton *regisiterBtn;
@property (nonatomic, strong) UIImageView *centerImage;
@property (nonatomic, strong) UIImageView *circleImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *backView;

@end

@implementation JQVisitorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)loadVisitorViewWithImage:(NSString *)image andContent:(NSString *)content {
    
    self.titleLabel.text = content;
    
    if (image == nil) {
        //首页
        self.centerImage.hidden = NO;
        
        [self startAnimation];
        
    }else {
        
        self.circleImage.image = [UIImage imageNamed:image];
        self.centerImage.hidden = YES;
        [self bringSubviewToFront:self.circleImage];

    }
    
}

//实现动画
- (void)startAnimation {
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    anim.repeatCount = MAXFLOAT;
    anim.byValue = @(2 * M_PI);
    anim.duration = 15;
    anim.removedOnCompletion = NO;
    
    [self.circleImage.layer addAnimation:anim forKey:nil];
    
}

//实现方法
- (void)LoginDidButtonClick {
    if ([self.delegate respondsToSelector:@selector(visitorWillLogin)]) {
        [self.delegate visitorWillLogin];
    }
}

- (void)RegistorDidButtonClick {
    if ([self.delegate respondsToSelector:@selector(visitorWillRegistor)]) {
        [self.delegate visitorWillRegistor];
    }
}


- (void)setupUI {
    self.backgroundColor = [[UIColor alloc] initWithWhite:0.93 alpha:1.0];
    
    [self addSubview:self.centerImage];
    [self addSubview:self.circleImage];
    [self addSubview:self.titleLabel];
    [self addSubview:self.LoginBtn];
    [self addSubview:self.regisiterBtn];
    [self addSubview:self.backView];
    
    [self.circleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY).offset(-30);
        
    }];
    
    [self.centerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.circleImage.mas_centerX);
        make.centerY.equalTo(self.circleImage.mas_centerY).offset(-10);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.circleImage.mas_bottom).offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@50);
        make.width.equalTo(@224);
    }];
    
    [self.LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@35);
        
    }];
    
    [self.regisiterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.width.equalTo(@100);
        make.height.equalTo(@35);
        
    }];
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.titleLabel.mas_top);
        make.top.equalTo(self.circleImage.mas_top);
        
    }];
    
}

//懒加载控件
- (UIButton *)LoginBtn {
    if (_LoginBtn == nil) {
        
        self.LoginBtn = [[UIButton alloc] init];
        [self.LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        
        UIImage *image = [UIImage resizebleImage:@"common_button_white_disable"];
        [self.LoginBtn setBackgroundImage:image forState:UIControlStateNormal];
        [self.LoginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        [self.LoginBtn addTarget:self action:@selector(LoginDidButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _LoginBtn;
}

- (UIButton *)regisiterBtn {
    if (_regisiterBtn == nil) {
        
        self.regisiterBtn = [[UIButton alloc] init];
        [self.regisiterBtn setTitle:@"注册" forState:UIControlStateNormal];
        
        UIImage *image = [UIImage resizebleImage:@"common_button_white_disable"];
        [self.regisiterBtn setBackgroundImage:image forState:UIControlStateNormal];
        [self.regisiterBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.regisiterBtn addTarget:self action:@selector(RegistorDidButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _regisiterBtn;
}


- (UIImageView *)circleImage {
    if (!_circleImage) {
        self.circleImage = [[UIImageView alloc] init];
        
        self.circleImage.image = [UIImage imageNamed:@"visitordiscover_feed_image_smallicon"];
    }
    return  _circleImage;
}

- (UIImageView *)centerImage {
    if (!_centerImage) {
        
        self.centerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visitordiscover_feed_image_house"]];
    }
    return _centerImage;
}

- (UIImageView *)backView {
    if (!_backView) {
        
        self.backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"visitordiscover_feed_mask_smallicon"]];
    }
    
    return _backView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"苦涩的痛吹通脸胖的感觉, 永远难忘记, 年少的我稀罕一个人在海关";
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self.titleLabel sizeToFit];
    }
    return _titleLabel;
}


@end
