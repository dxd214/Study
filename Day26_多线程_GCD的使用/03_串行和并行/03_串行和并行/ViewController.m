//
//  ViewController.m
//  03_串行和并行
//
//  Created by Chiang on 16/2/21.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 
 */

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test1];
//    [self test2];
//    [self test3];
    [self test4];
}

// 串行队列：
// 同步执行：
// 不开启新线程，队列中的人物按顺序执行：
-(void)test1 {
    // 创建串行队列：
    dispatch_queue_t queue = dispatch_queue_create("ChuanXing", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 20; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

// 串行队列：
// 异步执行：
// 只会开启一个新线程：
-(void)test2 {
    dispatch_queue_t queue = dispatch_queue_create("ChuanXing", DISPATCH_QUEUE_SERIAL);
    for (int i = 0; i < 20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

// 并行队列：
// 同步执行：
// 不会开启新线程：
-(void)test3 {
    dispatch_queue_t queue= dispatch_queue_create("BingXing", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 20; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

// 并行队列：
// 异步执行：
// 开启多个线程
// 并发执行，无序：
-(void)test4 {
    for (int i = 0; i < 20; i++) {
        dispatch_async(dispatch_queue_create("BingXing", DISPATCH_QUEUE_CONCURRENT), ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

@end
