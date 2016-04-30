//
//  ViewController.m
//  03_最大并发数
//
//  Created by Chiang on 16/2/22.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        // 设置最大并发数:
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < 1000; i++) {
        // 此处没有做限制，默认开启了很多线程：
        [self.queue addOperationWithBlock:^{
            NSLog(@"%d - %@", i, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:1.0f];
        }];
    }
}

@end
