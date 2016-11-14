//
//  JQOAuthController.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQOAuthController.h"
#import <SVProgressHUD.h>

@interface JQOAuthController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation JQOAuthController

- (void)loadView {
    self.webView = [[UIWebView alloc] init];
    
    self.view = self.webView;
    
    self.webView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomTitle:@"关闭" imageName:nil target:self action:@selector(dismissController)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomTitle:@"自动填充" imageName:nil target:self action:@selector(autoLogin)];
    
    [self loadAuthPage];

}

//回退控制器
- (void)dismissController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//自动登录
- (void)autoLogin {
    NSString *str = @"document.getElementById('userId').value = '409377708@qq.com', document.getElementById('passwd').value = 'sunjianqin2'";
    [self.webView stringByEvaluatingJavaScriptFromString:str];
}

//发送网络数据
- (void)loadAuthPage {
    
    NSString *url = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", client_id, redirect_uri];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [self.webView loadRequest:request];
    
}


//webView代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD show];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD dismiss];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //获取绝对路径
    NSString *urlString = request.URL.absoluteString;
    
    //截取需要的code
//    NSRange range = [urlString rangeOfString:@"code="];
    

//    if (range.length != 0) {
//        //截取code=后面的字符串
//        NSInteger fromIndex = range.location + range.length;
//        NSString *code = [urlString substringFromIndex:fromIndex];
//        
//        NSLog(@"%@", code);
//        
//        //        [self loadAccessTokenWithCode:code];
////        [self loadAccessTokenWithCode:code finished:^NSArray *(NSError *error) {
////            if (error != nil) {
////                [SVProgressHUD showErrorWithStatus:@"网络太次"];
////            }
////            return nil;
////        }];
//        
//        //禁止加载回调地址
//        return NO;
//    }
    NSString *flag = @"code=";
    
    if ([urlString containsString:flag]) {
        
        NSString *query = request.URL.query;
        
        NSString *code = [query substringFromIndex:flag.length];
        
        return NO;
    }
    
    
    
    return YES;
}


@end
