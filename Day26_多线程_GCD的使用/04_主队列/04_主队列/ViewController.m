//
//  ViewController.m
//  04_主队列
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
}

// 主队列：
-(void)test1 {
    // 获取一个主队列：
    dispatch_queue_t queue = dispatch_get_main_queue();

    for (int i = 0; i < 20; i++) {
#warning 此处用同步执行会造成线程死锁问题。
        dispatch_async(queue, ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

@end
