//
//  ViewController.m
//  03_偏好设置存储
//
//  Created by Chiang on 16/3/3.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建偏好设置对象：
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setBool:YES forKey:@"isAutoLogin"];
    [defaults setObject:@"YaoMing" forKey:@"username"];
    [defaults setObject:@"123456" forKey:@"password"];
    
    // 同步存储：
    [defaults synchronize];
}

// 读取偏好设置：
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL isAutoLogin = [defaults boolForKey:@"isAutoLogin"];
    NSString *username = [defaults objectForKey:@"username"];
    NSString *password = [defaults objectForKey:@"password"];
    
    NSLog(@"<------isAutoLogin: %d------------username: %@------------password: %@----------->", isAutoLogin, username, password);
}

@end
