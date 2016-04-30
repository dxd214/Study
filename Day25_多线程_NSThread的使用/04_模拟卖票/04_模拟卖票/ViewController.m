//
//  ViewController.m
//  04_模拟卖票
//
//  Created by Chiang on 16/2/20.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger tickets;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tickets = 100;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    threadA.name = @"窗口A";
    [threadA start];
    
    NSThread *threadB = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    threadB.name = @"窗口B";
    [threadB start];
}

-(void)sellTickets {
    while (YES) {
        // 互斥锁参数：任何继承自NSObject对象都可以，且必须是所有线程都能访问的，一般用self就行：
        @synchronized(self) {
            if (self.tickets > 0) {
                self.tickets--;
                [NSThread sleepForTimeInterval:1.0f];
                NSLog(@"剩余：%ld - %@", self.tickets, [NSThread currentThread]);
            } else {
                NSLog(@"已售完....");
                break;
            }
        }
    }
}

@end
