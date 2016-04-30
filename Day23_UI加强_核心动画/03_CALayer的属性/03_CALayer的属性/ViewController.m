//
//  ViewController.m
//  03_CALayer的属性
//
//  Created by Chiang on 16/3/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *cuLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *cuLayer = [[CALayer alloc] init];
    [cuLayer setBackgroundColor:[UIColor blueColor].CGColor];
    
    // 位置和大小：
    cuLayer.position = CGPointMake(200, 200);
    cuLayer.bounds = CGRectMake(0, 0, 200, 200);
    // 默认(0.5, 0.5)
    cuLayer.anchorPoint = CGPointMake(0.8, 0.3);
    
    [self.view.layer addSublayer:cuLayer];
    self.cuLayer = cuLayer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.cuLayer.anchorPoint = CGPointMake(0.5, 0.5);
}

@end
