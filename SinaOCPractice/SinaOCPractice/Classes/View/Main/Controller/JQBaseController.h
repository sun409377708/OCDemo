//
//  JQBaseController.h
//  SinaOCPractice
//
//  Created by maoge on 16/11/14.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JQVisitorView.h"

@interface JQBaseController : UITableViewController

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, strong) JQVisitorView *visitorView;


@end
