//
//  AppDelegate.m
//  SinaOCPractice
//
//  Created by maoge on 16/11/10.
//  Copyright © 2016年 maoge. All rights reserved.
//

#import "AppDelegate.h"
#import "JQMainTabController.h"
#import "JQWelcomeViewController.h"
#import "JQUserAccountViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self getChangeController];
    
    _window = [[UIWindow alloc] initWithFrame:SCREEN_BOUNDS];

    _window.rootViewController = [self defaultViewController];
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (UIViewController *)defaultViewController {
    
    return  [JQUserAccountViewModel shared].isUserLogin ? [[JQWelcomeViewController alloc] init] : [[JQMainTabController alloc] init];
}

- (void)getChangeController {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVC:) name:kChangeRootViewControllerNotification object:nil];
}

- (void)changeVC:(NSNotification *)nofy {
    
    JQWelcomeViewController *welcomeVC = [[JQWelcomeViewController alloc] init];
    
    if ([nofy.object isEqualToString:@"oauth"]) {
        _window.rootViewController = welcomeVC;
    }else {
        _window.rootViewController = [[JQMainTabController alloc] init];
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
