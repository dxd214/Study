//
//  ViewController.m
//  03_线程的状态
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
    [self test1];
}

-(void)run {
    NSLog(@"%s", __func__);
    for (int i = 0; i < 100; i++) {
        NSLog(@"%d - %@", i, [NSThread currentThread]);
        // 打印一次睡一秒：
//        [NSThread sleepForTimeInterval:1.0f];
        // 进入阻塞状态：
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0f]];
        
        // 强制结束：
        if (i == 10) {
            [NSThread exit];
        }
        // 后面的代码不会再被执行：
    }
    NSLog(@"<----------------------------------->");
}

-(void)test1 {
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    threadA.name = @"ThreadA";
    // 放入可线程池，等待被调度（就绪状态）：
    [threadA start];
}

@end
