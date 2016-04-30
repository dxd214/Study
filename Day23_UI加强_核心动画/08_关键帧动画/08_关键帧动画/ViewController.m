//
//  ViewController.m
//  08_关键帧动画
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
    [cuLayer setBackgroundColor:[UIColor redColor].CGColor];
    cuLayer.position = CGPointMake(200, 300);
    cuLayer.bounds = CGRectMake(0, 0, 150, 150);
    [self.view.layer addSublayer:cuLayer];
    
    self.cuLayer = cuLayer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
}

-(void)test1 {
    CAKeyframeAnimation *cka = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    /**
    NSValue *value0 = [NSValue valueWithCGPoint:self.cuLayer.position];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(10, 300)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(325, 10)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(325, 300)];
    NSValue *value5 = [NSValue valueWithCGPoint:self.cuLayer.position];
    */
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 300, 600)];
    cka.path = path.CGPath;
    
    cka.duration = 2.0f;
    
//    cka.values = @[value0, value1, value2, value3, value4, value5];
    
    [self.cuLayer addAnimation:cka forKey:nil];
}

@end
