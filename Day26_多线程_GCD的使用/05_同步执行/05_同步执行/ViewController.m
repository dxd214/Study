//
//  ViewController.m
//  05_同步执行
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
    [self downloadGame];
}

-(void)downloadGame {
    // 创建一个并发队列：
    dispatch_queue_t queue = dispatch_queue_create("BingXing", DISPATCH_QUEUE_CONCURRENT);

    dispatch_async(queue, ^{
        dispatch_sync(queue, ^{
            NSLog(@"下载zip01.....%@", [NSThread currentThread]);
        });
        dispatch_sync(queue, ^{
            NSLog(@"下载zip02.....%@", [NSThread currentThread]);
        });
        dispatch_sync(queue, ^{
            NSLog(@"下载zip03.....%@", [NSThread currentThread]);
        });

        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"下载完成，解压.....%@", [NSThread currentThread]);
        });
    });
}

@end
