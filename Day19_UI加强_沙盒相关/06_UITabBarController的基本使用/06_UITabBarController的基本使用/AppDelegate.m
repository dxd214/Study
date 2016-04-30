//
//  AppDelegate.m
//  06_UITabBarController的基本使用
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FourViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController.view setBackgroundColor:[UIColor yellowColor]];
    
    OneViewController *one = [[OneViewController alloc] init];
    TwoViewController *two = [[TwoViewController alloc] init];
    ThreeViewController *three = [[ThreeViewController alloc] init];
    FourViewController *four = [[FourViewController alloc] init];
    
    // 设置标题：
    one.tabBarItem.title = @"One";
    two.tabBarItem.title = @"Two";
    three.tabBarItem.title = @"Three";
    four.tabBarItem.title = @"four";
    
    // 图片颜色会默认渲染为蓝色：
    // UIImageRenderingModeAlwaysOriginal 表示用原生样式渲染：
    one.tabBarItem.image = [UIImage imageNamed:@"navigationbar_friendsearch"];
    one.tabBarItem.selectedImage = [[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tabBarController.viewControllers = @[one, two, three, four];
    
    window.rootViewController = tabBarController;
    [window makeKeyAndVisible];
    self.window = window;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
