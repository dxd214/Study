//
//  ViewController.m
//  06_CALayer的transform属性
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
    cuLayer.position = CGPointMake(100, 200);
    cuLayer.bounds = CGRectMake(0, 0, 150, 150);
    [self.view.layer addSublayer:cuLayer];
    
    self.cuLayer = cuLayer;
    
    [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(test3) userInfo:nil repeats:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test2];
    [self test3];
}

-(void)test1 {
    // 平移：
    //    self.cuLayer.transform = CATransform3DTranslate(self.cuLayer.transform, 0, 50, 50);
    // kvc方式：
    NSValue *value = [NSValue valueWithCATransform3D:CATransform3DTranslate(self.cuLayer.transform, 50, 50, 0)];
    [self.cuLayer setValue:value forKeyPath:@"transform"];
}

-(void)test2 {
    // 缩放：
    self.cuLayer.transform = CATransform3DScale(self.cuLayer.transform, 2, 2, 2);
}

-(void)test3 {
    [UIView animateWithDuration:0.3 animations:^{
        self.cuLayer.transform = CATransform3DRotate(self.cuLayer.transform, M_PI_4, 1, 1, 1);
    }];
}

@end
