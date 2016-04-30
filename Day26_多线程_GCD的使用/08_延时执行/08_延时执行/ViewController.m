//
//  ViewController.m
//  08_延时执行
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
    [self test1];
}

-(void)run {
    NSLog(@"%s", __func__);
}

-(void)test1 {
    // timer：
//    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(run) userInfo:nil repeats:YES];
    
//    [self performSelector:@selector(run) withObject:nil afterDelay:2.0f];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        <#code to be executed after a specified delay#>
    });
}

@end
