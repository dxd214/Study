//
//  ViewController.m
//  07_GCD综合练习
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
//    [self test1];
    [self test2];
    
    NSLog(@"<------------------> %@", [NSThread currentThread]);
}

/**
-(void)test1 {
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(mainQueue, ^{
        NSLog(@"<++++++++++++++++++++> %@", [NSThread currentThread]);
        
        dispatch_queue_t serialQueue = dispatch_queue_create("ChuanXing", DISPATCH_QUEUE_SERIAL);
        dispatch_async(serialQueue, ^{
            NSLog(@"任务1....%@", [NSThread currentThread]);
        });
        dispatch_async(serialQueue, ^{
            NSLog(@"任务2....%@", [NSThread currentThread]);
        });
        [NSThread sleepForTimeInterval:3.0f];
        
        dispatch_sync(serialQueue, ^{
            NSLog(@"任务3....%@", [NSThread currentThread]);
        });
        dispatch_sync(serialQueue, ^{
            NSLog(@"任务4....%@", [NSThread currentThread]);
        });
        [NSThread sleepForTimeInterval:3.0f];
        
        dispatch_queue_t concurrentQueue = dispatch_queue_create("BingXing", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(concurrentQueue, ^{
            NSLog(@"任务5....%@", [NSThread currentThread]);
        });
        dispatch_async(concurrentQueue, ^{
            NSLog(@"任务6....%@", [NSThread currentThread]);
        });
        dispatch_async(concurrentQueue, ^{
            NSLog(@"任务7....%@", [NSThread currentThread]);
        });
    });
}
*/

-(void)test2 {
    dispatch_queue_t serialQueue = dispatch_queue_create("ChuanXing", DISPATCH_QUEUE_SERIAL);
    dispatch_async(serialQueue, ^{
        [self run:1];
    });
    dispatch_async(serialQueue, ^{
        [self run:2];
    });
    
    dispatch_sync(serialQueue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self run:3];
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            [self run:4];
        });
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
        dispatch_async(globalQueue, ^{
            [self run:5];
        });
        dispatch_async(globalQueue, ^{
            [self run:6];
        });
        dispatch_async(globalQueue, ^{
            [self run:7];
        });
    });
}

-(void)run:(NSInteger)number {
    NSLog(@"正在执行任务%ld ,%@", number, [NSThread currentThread]);
}

@end
