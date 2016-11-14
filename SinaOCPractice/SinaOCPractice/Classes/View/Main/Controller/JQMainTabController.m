//
//  JQMainTabController.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/12.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "JQMainTabController.h"
#import "JQMainNavController.h"
#import "JQMainTabBar.h"

@interface JQMainTabController ()

@end

@implementation JQMainTabController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1. 自定义tabbar
    JQMainTabBar *tabView = [[JQMainTabBar alloc] init];
    [self setValue:tabView forKey:@"tabBar"];
    
    // 2. 添加控制器
    [self addControllers];
    
    tabView.btnBlock = ^{
        
        NSLog(@"按钮被点击");
    };
    
}

- (void)addControllers {
    
    // 1. 实例化一个可变数组
    NSMutableArray *mutable = [NSMutableArray array];
    
    // 2. 添加
    [mutable addObject:[self addChildControllerWith:@"JQHomeController" title:@"首页" normalImage:@"tabbar_home"]];
    [mutable addObject:[self addChildControllerWith:@"JQMessageController" title:@"消息" normalImage:@"tabbar_message_center"]];
    [mutable addObject:[self addChildControllerWith:@"JQDiscoverController" title:@"发现" normalImage:@"tabbar_discover"]];
    [mutable addObject:[self addChildControllerWith:@"JQProfileController" title:@"我" normalImage:@"tabbar_profile"]];

    // 3. 赋值
    self.viewControllers = mutable;
    
    
}

- (UIViewController *)addChildControllerWith:(NSString *)clsName title:(NSString *)title normalImage:(NSString *)normalImage {
    // 1. 把字符串转为class
    Class cls = NSClassFromString(clsName);
    
    NSAssert(cls, @"加载 文件时指定的 clsName - %@ 错误", clsName);

    // 2. 实例化控制器
    UIViewController *controller = [[cls alloc] init];
    
    // 3. 设置控制器的属性
    // 3.1 设置title
    controller.title = title;
    
    // 3.2 设置普通状态的image
    controller.tabBarItem.image = [UIImage imageNamed:normalImage];
    
    // 3.3 设置选中的图片
    NSString *selName = [normalImage stringByAppendingString:@"_selected"];
    
    UIImage *selImage = [[UIImage imageNamed:selName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.selectedImage = selImage;
    
    // 4. 设置选中样式
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    // 4.1 设置底部文字向上偏移
    controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    
    
    // 5. 实例化导航控制器
    JQMainNavController *nav = [[JQMainNavController alloc] initWithRootViewController:controller];
    
    return nav;
    
}

@end
