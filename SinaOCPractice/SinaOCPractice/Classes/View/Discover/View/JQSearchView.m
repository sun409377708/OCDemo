//
//  JQSearchView.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQSearchView.h"

@interface JQSearchView ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textRightConstraint;

@property (nonatomic, strong) UIImageView *leftview;


@end

@implementation JQSearchView

+ (instancetype)loadSearchView {
    
    UINib *nib = [UINib nibWithNibName:@"SearchView" bundle:nil];
    
    return [nib instantiateWithOwner:nil options:nil].lastObject;
}

- (void)awakeFromNib {

    [super awakeFromNib];
    
    self.bounds = CGRectMake(0, 0, SCREEN_WIDTH, 35);
    
    //设置背景色
    self.backgroundColor = [UIColor clearColor];
    
    //设置textField属性
    self.textField.borderStyle = UITextBorderStyleNone;
    self.textField.backgroundColor = [UIColor whiteColor];
    
    //设置左视图大小
    self.leftview.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    
    //设置左边视图
    self.textField.leftView = self.leftview;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    
 
    //设置圆角
    self.textField.layer.cornerRadius = 10;
    self.textField.layer.masksToBounds = YES;
}

- (IBAction)textChange:(UITextField *)sender {

    self.textRightConstraint.constant = self.cancelBtn.bounds.size.width + 5;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self layoutIfNeeded];
    }];
}

- (IBAction)cancelBtnClick:(UIButton *)sender {

    self.textRightConstraint.constant = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self layoutIfNeeded];
    }];
    
     [self.textField resignFirstResponder];
}

//懒加载左部视图
- (UIImageView *)leftview {
    
    if (!_leftview) {
        
        _leftview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        
        _leftview.contentMode = UIViewContentModeCenter;
    }
    
    return _leftview;
}

@end
