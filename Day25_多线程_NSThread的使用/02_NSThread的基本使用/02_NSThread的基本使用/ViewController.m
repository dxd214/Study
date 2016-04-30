//
//  ViewController.m
//  02_NSThread的基本使用
//
//  Created by Chiang on 16/2/20.
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
//    [self test1];
//    [self test2];
    [self test3];
}

-(void)run {
    for (int i = 0; i < 200; i++) {
        NSLog(@"%@ - %d", [NSThread currentThread], i);
    }
}

// 创建方法1:
-(void)test1 {
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    threadA.name = @"A:";
    // 设置优先级，默认0.5，一般不用手动设置：
    threadA.threadPriority = 0.5;
    [threadA start];
}

// 创建方法2:
-(void)test2 {
    // 类方法创建：
    [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
}

// 创建方法3:
-(void)test3 {
    // 隐式创建：
    [self performSelectorInBackground:@selector(run) withObject:nil];
}

@end
