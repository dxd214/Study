//
//  ViewController.m
//  06_位移枚举
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

/**
typedef enum {
    ActionTop = 1 << 0,
    ActionBottom = 1 << 1,
    ActionLeft = 1 << 2,
    ActionRight = 1 << 3
} ActionEnum;
*/

typedef NS_OPTIONS(NSInteger, ActionEnum) {
    ActionTop = 1 << 0,
    ActionBottom = 1 << 1,
    ActionLeft = 1 << 2,
    ActionRight = 1 << 3
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 按位或：有1就是1，其他为0；
    [self matchAction:ActionRight | ActionLeft];
}

-(void)matchAction:(ActionEnum)action {
    
    // 按位与：同时为1即为1，其他为0；
    if ((action & ActionTop) == ActionTop) {
        NSLog(@"ActionTop");
    }
    
    if ((action & ActionBottom) == ActionBottom)  {
        NSLog(@"ActionBottom");
    }
    
    if ((action & ActionLeft) == ActionLeft) {
        NSLog(@"ActionLeft");
    }
    
    if ((action & ActionRight) == ActionRight ) {
        NSLog(@"ActionRight");
    }
}

@end
