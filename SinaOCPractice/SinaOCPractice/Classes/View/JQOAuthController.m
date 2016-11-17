//
//  JQOAuthController.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQOAuthController.h"
#import <SVProgressHUD.h>
#import "NetworkTools.h"
#import "JQUserAccountViewModel.h"

NSString *const kChangeRootViewControllerNotification = @"kChangeRootViewControllerNotification";

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
    NSLog(@"~~~~~~~~~~~~~~~~~~~");
    //截取需要的code
    NSString *flag = @"code=";
    
    if ([urlString containsString:flag]) {
        
        NSString *query = request.URL.query;
        
        NSString *code = [query substringFromIndex:flag.length];
        
        [[JQUserAccountViewModel shared] loadAccessToken:code finished:^(BOOL isSuccess) {
            if (!isSuccess) {
                
                [SVProgressHUD showErrorWithStatus:@"网络错误"];
                return;
            }
            
            //跳转控制器
            [[NSNotificationCenter defaultCenter] postNotificationName:kChangeRootViewControllerNotification object:@"oauth"];
            
        }];
        
        
        return NO;
    }
    return YES;
}

//- (void)loadAccessToken:(NSString *)code finished:(void(^)(BOOL isSuccess))finished {
//    
//    NSString *urlString = @"https://api.weibo.com/oauth2/access_token";
//    
//    NSDictionary *parameter = @{@"client_id": client_id,
//                                @"client_secret":client_secret,
//                                @"grant_type" : @"authorization_code",
//                                @"code":code,
//                                @"redirect_uri":redirect_uri};
//    
//    [[NetworkTools sharedTools] request:POST urlString:urlString parameters:parameter finished:^(id responseObject, NSError *error) {
//        
//        if (error != nil) {
//            finished(YES);
//            return;
//        }
//        
//        NSDictionary *dict = responseObject;
//        
//        [self loadUserInfo:dict finished:finished];
//        
//    }];
//    
//}
//
//- (void)loadUserInfo:(NSDictionary *)dict finished:(void(^)(BOOL isSuccess))finished {
//    
//    NSString *urlString = @"https://api.weibo.com/2/users/show.json";
//    NSDictionary *parameter = @{@"access_token" : dict[@"access_token"],
//                                @"uid" : dict[@"uid"]};
//    
//    
//    [[NetworkTools sharedTools] request:GET urlString:urlString parameters:parameter finished:^(id responseObject, NSError *error) {
//        
//        if (error != nil) {
//            finished(YES);
//            return;
//        }
//        
//        NSMutableDictionary *dictM = responseObject;
//        
//        //遍历字典
//        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
//            
//            dictM[key] = value;
//        }];
//        
//        //字典转模型
//        
//        
//        
//        //保存数据
//        finished(YES);
//        
//        
//    }];
//}


@end
