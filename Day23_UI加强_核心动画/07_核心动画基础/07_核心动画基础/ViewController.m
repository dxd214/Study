//
//  ViewController.m
//  07_核心动画基础
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
    [self.view.layer addSublayer:cuLayer];
    [cuLayer setBackgroundColor:[UIColor redColor].CGColor];
    cuLayer.position = self.view.center;
    cuLayer.bounds = CGRectMake(0, 0, 200, 200);
    
    self.cuLayer = cuLayer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test2];
    [self test3];
}

// 基本动画：
-(void)test1 {
    // 创建几本动画对象：
    CABasicAnimation *cba = [CABasicAnimation animation];
    cba.keyPath = @"position";
    
    // 设置平移的起始值：
    cba.fromValue = [NSValue valueWithCGPoint:self.view.center];
    // 终点：
    cba.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    
    // 隐试代理：
    cba.delegate = self;
    cba.removedOnCompletion = NO;
    cba.fillMode = kCAFillModeForwards;
    
    [self.cuLayer addAnimation:cba forKey:@"cba.position"];
}

// 缩放：
-(void)test2 {
    CABasicAnimation *cba = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    cba.byValue = @(0.5);
    cba.removedOnCompletion = NO;
    cba.fillMode = kCAFillModeForwards;
    [self.cuLayer addAnimation:cba forKey:@"cba.scale"];
}

// 旋转：
-(void)test3 {
    CABasicAnimation *cba = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    cba.toValue = @(M_PI_4);
    
    cba.duration = 2.0f;
    cba.removedOnCompletion = NO;
    cba.fillMode = kCAFillModeForwards;
    [self.cuLayer addAnimation:cba forKey:@"cba.rotation"];
}

-(void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"%s <--------> %@", __func__, NSStringFromCGPoint(self.cuLayer.position));
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s <++++++++> %@", __func__, NSStringFromCGPoint(self.cuLayer.position));
}

@end
