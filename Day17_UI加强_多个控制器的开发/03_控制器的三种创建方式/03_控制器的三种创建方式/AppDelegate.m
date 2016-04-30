//
//  AppDelegate.m
//  03_控制器的三种创建方式
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "JDViewController.h"
#import "JDViewController3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    [self createWithCode];
//    [self createWithStoryboard];
//    [self createWithStoryboard2];
//    [self createWithXib];
    [self createWithXib2];
    
    return YES;
}

// 通过代码创建：
-(void)createWithCode {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[JDViewController alloc] init];
    [self.window makeKeyAndVisible];
}

// 通过storyboard创建：
-(void)createWithStoryboard {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 加载sb文件：
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"JDViewController" bundle:nil];
    // 通过sb得到vc：
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    [viewController.view setBackgroundColor:[UIColor blueColor]];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
}

-(void)createWithStoryboard2 {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"JDViewController2" bundle:nil];
    UITableViewController *tvController = [storyboard instantiateInitialViewController];
    self.window.rootViewController = tvController;
    [self.window makeKeyAndVisible];
}

// 通过xib加载：
-(void)createWithXib {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    JDViewController3 *viewController = [[JDViewController3 alloc] initWithNibName:@"TestView" bundle:nil];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
}

-(void)createWithXib2 {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 这种创建当时会自动找名称和控制器相近或者完全相同的的xib文件：
    JDViewController3 *viewController = [[JDViewController3 alloc] init];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
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
