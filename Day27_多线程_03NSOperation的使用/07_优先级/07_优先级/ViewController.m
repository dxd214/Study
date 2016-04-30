//
//  ViewController.m
//  07_优先级
//
//  Created by Chiang on 16/2/22.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSOperationQueue *queue2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSOperationQueue *)queue {
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 2;

        // 设置优先级：
        [_queue setQualityOfService:NSQualityOfServiceUserInteractive];
    }
    return _queue;
}

-(NSOperationQueue *)queue2 {
    if (!_queue2) {
        _queue2 = [[NSOperationQueue alloc] init];
        _queue2.maxConcurrentOperationCount = 2;
    }
    return _queue2;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
    [self test2];
}

-(void)test1 {
    for (int i = 0; i < 20; i++) {
        NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"queue1-------> %d - %@", i, [NSThread currentThread]);
        }];
        
        // 即使设置了优先级，任务也不一定会优先执行：
        if (i == 10) {
//            [operation setQueuePriority:NSOperationQueuePriorityVeryHigh];
            [operation setQualityOfService:NSQualityOfServiceUserInteractive];
        }
        
        [self.queue addOperation:operation];
        [NSThread sleepForTimeInterval:1.0f];
    }
}

-(void)test2 {
    for (int i = 0; i < 20; i++) {
        NSOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"queue2++++++++> %d - %@", i, [NSThread currentThread]);
        }];
        
        // 即使设置了优先级，任务也不一定会优先执行：
        if (i == 10) {
            //            [operation setQueuePriority:NSOperationQueuePriorityVeryHigh];
            [operation setQualityOfService:NSQualityOfServiceUserInteractive];
        }
        
        [self.queue2 addOperation:operation];
        [NSThread sleepForTimeInterval:1.0f];
    }
}

@end
