//
//  ViewController.m
//  01_应用程序的对象
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)buttonClick {
    // 单例对象：
    UIApplication *app1 = [UIApplication sharedApplication];
    NSLog(@"%p", app1);
    UIApplication *app2 = [UIApplication sharedApplication];
    NSLog(@"%p", app2);
    
    // 网络指示器：
    app1.networkActivityIndicatorVisible = !app1.networkActivityIndicatorVisible;
    
    // 应用图标的数字：
    // 获取当前手机系统版本：
    double systemVer = [[UIDevice currentDevice].systemVersion doubleValue];
    // 如果系统版本在8.0或者智商，则执行代码：
    if (systemVer >= 8.0) {
        UIUserNotificationCategory *category = [[UIUserNotificationCategory alloc] init];
        NSSet *set = [NSSet setWithObject:category];
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:set];
        [app1 registerUserNotificationSettings:settings];
        app1.applicationIconBadgeNumber = 5;
    } else {
        NSLog(@"%s", __func__);
    }
    
    // 隐藏状态栏：
    app1.statusBarHidden = NO;
}

@end
