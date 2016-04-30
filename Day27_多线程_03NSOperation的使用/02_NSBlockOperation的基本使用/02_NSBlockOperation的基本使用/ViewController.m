//
//  ViewController.m
//  02_NSBlockOperation的基本使用
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
    }
    return _queue;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
    [self test5];
}

-(void)test1 {
    for (int i = 0; i < 20; i++) {
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"task%d - %@", i, [NSThread currentThread]);
        }];
        [self.queue addOperation:operation];
    }
}

// 简写的方式：
-(void)test2 {
    for (int i = 0; i < 20; i++) {
        [self.queue addOperationWithBlock:^{
            NSLog(@"task %d - %@", i, [NSThread currentThread]);
        }];
    }
}

// 追加执行block：
-(void)test3 {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"<----> %@", [NSThread currentThread]);
    }];
    
    // 追加：
    [operation addExecutionBlock:^{
        NSLog(@"<++++> %@", [NSThread currentThread]);
    }];
    
    [self.queue addOperation:operation];
}

-(void)test4 {
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"<----> %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"<++++> %@", [NSThread currentThread]);
    }];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"<''''> %@", [NSThread currentThread]);
    }];
    
    [self.queue addOperations:@[op1, op2, op3] waitUntilFinished:NO];
}

-(void)test5 {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"<-----> %@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:2.0f];
    }];

    // 设置任务block完成后的操作：
    [operation setCompletionBlock:^{
        NSLog(@"<+++++> %@", [NSThread currentThread]);
    }];
    
    [self.queue addOperation:operation];
}

@end
