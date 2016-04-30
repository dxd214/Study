//
//  ViewController.m
//  06_全局并发队列
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
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
}

-(void)test1 {
    // 参数1：优先级，填0为默认；
    // 参数2：苹果官方保留参数，暂时无用，直接填0。
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 20; i++) {
        dispatch_async(queue, ^{
            NSLog(@"%d-%@", i, [NSThread currentThread]);
        });
    }
}

@end
