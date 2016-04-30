//
//  ViewController.m
//  01_主线程的消息循环
//
//  Created by Chiang on 16/2/20.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL shouldKeepRunning;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    shouldKeepRunning = YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test1];
    [self test2];
}

-(void)run {
    NSLog(@"%@", [NSRunLoop currentRunLoop].currentMode);
    NSLog(@"<---------------> - %@", [NSThread currentThread]);
    // 直接使用run方法无法停止循环：
//    [[NSRunLoop currentRunLoop] run];
    // 设定时间：
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3.0f]];
    NSLog(@"over........");
}

-(void)run2 {
    NSLog(@"run2........");
}

// 主线程
-(void)test1 {
    // 创建一个定时器：
    // repeats：是否重复
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(run) userInfo:nil repeats:YES];
    // 拿到主线程的消息循环：
    // NSDefaultRunLoopMode：拖动界面，定时源不运行：
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)test2 {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [thread start];
    
    [self performSelector:@selector(run2) onThread:thread withObject:nil waitUntilDone:NO];
}

@end
