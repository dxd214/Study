//
//  ViewController.m
//  01_耗时操作模拟
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

    NSLog(@"%@", [NSThread currentThread]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self longTimeOperation];
    // 最基础的多线程运行：
    [self performSelectorInBackground:@selector(longTimeOperation) withObject:nil];
}

-(void)longTimeOperation {
    for (int i = 0; i < 20000; i++) {
        NSLog(@"-----------> %d -- %@", i, [NSThread currentThread]);
    }
}

@end
