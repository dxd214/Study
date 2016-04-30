//
//  ViewController.m
//  01_NSOperation的基本使用
//
//  Created by Chiang on 16/2/22.
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
    [self test2];
}

-(void)run:(NSNumber *)number {
    NSLog(@"任务%d - %@", number.intValue, [NSThread currentThread]);
}

-(void)test1 {
    // NSOperation是一个抽象类，必须用它的子类进行实例化：
    for (int i = 0; i < 20; i++) {
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run:) object:@(i)];
        [operation start];
    }
}

-(void)test2 {
    // 创建一个队列：
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 操作：
    for (int i = 0; i < 20; i++) {
        NSOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run:) object:@(i)];
        // 加入队列：
        [queue addOperation:operation];
    }
}

@end
