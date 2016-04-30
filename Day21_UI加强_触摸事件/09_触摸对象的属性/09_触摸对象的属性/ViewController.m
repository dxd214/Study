//
//  ViewController.m
//  09_触摸对象的属性
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "JDView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet JDView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    
//    NSLog(@"%ld", touch.tapCount);
//    NSLog(@"%@", touch.view);
//    
//    CGPoint locPoint = [touch locationInView:touch.view];
//    NSLog(@"%@", NSStringFromCGPoint(locPoint));
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view];
    // 获取上一个点：
    CGPoint lastPoint = [touch previousLocationInView:touch.view];
    // 计算偏移量：
    CGFloat offsetX = locPoint.x - lastPoint.x;
    CGFloat offxsetY = locPoint.y - lastPoint.y;
    
    self.redView.center = CGPointMake(self.redView.center.x + offsetX, self.redView.center.y + offxsetY);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view];
    // 获取上一个点：
    CGPoint lastPoint = [touch previousLocationInView:touch.view];
    // 计算偏移量：
    CGFloat offsetX = locPoint.x - lastPoint.x;
    CGFloat offxsetY = locPoint.y - lastPoint.y;
    
    self.redView.center = CGPointMake(self.redView.center.x + offsetX, self.redView.center.y + offxsetY);
}

@end
