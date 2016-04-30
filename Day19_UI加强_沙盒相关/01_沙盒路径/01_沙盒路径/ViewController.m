//
//  ViewController.m
//  01_沙盒路径
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
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test2];
//    [self test3];
    [self test4];
}

-(void)test1 {
    // 沙盒路径：
    NSLog(@"<-------Sandbox Path:-------> %@", NSHomeDirectory());
    // Bundle Path：
    NSLog(@"<--------Bundle Path--------> %@", [NSBundle mainBundle].bundlePath);
}

// 拿到Documents:
-(void)test2 {
    // 方式一：
//    NSString *homeStr = NSHomeDirectory();
    // 拼接字符串：
//    NSString *docPath = [homeStr stringByAppendingString:@"/Documents"];
//    NSLog(@"<--------Documents Path:---------> %@", docPath);
    
    // 方式二：
//    NSString *homeStr = NSHomeDirectory();
//    NSString *docPath = [homeStr stringByAppendingPathComponent:@"Documents"];
//    NSLog(@"<--------Documents Path:---------> %@", docPath);
    
    // 方式三：
    /**
     1.目标文件夹；
     2.作用域：
     3.是否显示全部路径。
     */
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"<--------Documents Path:---------> %@", docPath);
}

// cache：
-(void)test3 {
    // 获取cache文件路径：
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"<--------Documents Path:---------> %@", cachePath);
}

// 偏好设置：
-(void)test4 {
    // 获取临时文件夹：
    NSLog(@"<----------Temp Path:-----------> %@", NSTemporaryDirectory());
}

@end
