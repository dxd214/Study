//
//  ViewController.m
//  04_CALayer的课动画属性
//
//  Created by Chiang on 16/3/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *cuLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *cuLayer = [CALayer layer];
    [cuLayer setBackgroundColor:[UIColor grayColor].CGColor];
    cuLayer.position = CGPointMake(200, 200);
    cuLayer.bounds = CGRectMake(0, 0, 150, 150);
    [self.view.layer addSublayer:cuLayer];
    
    self.cuLayer = cuLayer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view];
    
    // 开始动画：
    [CATransaction begin];
    // 是否开启动画：
    [CATransaction setDisableActions:NO];
    // 设置动画时间：
    [CATransaction setAnimationDuration:2.0f];
    self.cuLayer.position = locPoint;
    // 提交动画：
    [CATransaction commit];
}

@end
