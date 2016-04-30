//
//  ViewController.m
//  06_依赖关系
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
    [self test1];
}

-(void)test1 {
//    [self.queue addOperationWithBlock:^{
//        NSLog(@"登录 %@", [NSThread currentThread]);
//    }];
//    [self.queue addOperationWithBlock:^{
//        NSLog(@"付费 %@", [NSThread currentThread]);
//    }];
//    [self.queue addOperationWithBlock:^{
//        NSLog(@"下载 %@", [NSThread currentThread]);
//    }];
    
    NSOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"登录 %@", [NSThread currentThread]);
    }];
    NSOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"付费 %@", [NSThread currentThread]);
    }];
    NSOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载 %@", [NSThread currentThread]);
    }];
    
    NSOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"更新UI %@", [NSThread currentThread]);
    }];

    // 依赖关系：
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    [op4 addDependency:op3];
    
    NSOperationQueue *main = [NSOperationQueue mainQueue];
    [main addOperation:op4];
    [self.queue addOperations:@[op1, op2, op3] waitUntilFinished:NO];
    
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        NSLog(@"更新UI %@", [NSThread currentThread]);
//    }];
}

@end
