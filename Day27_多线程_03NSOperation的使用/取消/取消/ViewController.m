//
//  ViewController.m
//  取消
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
        _queue.maxConcurrentOperationCount = 2;
    }
    return _queue;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < 500; i++) {
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"%d - %@", i, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:1.0f];
        }];
        [self.queue addOperation:operation];
    }
}

// 暂停：
- (IBAction)clickToSuspend {
    [self.queue setSuspended:YES];
    NSLog(@"%s", __func__);
}

// 继续：
- (IBAction)clickToContinue {
    [self.queue setSuspended:NO];
    NSLog(@"%s", __func__);
}

// 取消：
- (IBAction)clickToCancel {
    [self.queue cancelAllOperations];
}

@end
