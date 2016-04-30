//
//  CustomView.m
//  01_使用Quarzt2D绘图
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
//    [self test2];
    [self test3];
}

// 画三角形1:
-(void)test1 {
    // 获取当前图形上下文对象：
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 向图形上下文对象中添加路径：
    CGContextMoveToPoint(context, 100, 150);
    // 划线：
    CGContextAddLineToPoint(context, 250, 300);
    CGContextAddLineToPoint(context, 80, 300);
    CGContextAddLineToPoint(context, 100, 150);
    // 渲染：
    CGContextStrokePath(context);
}

// 画三角形2:
-(void)test2 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 200, 20);
    CGContextAddLineToPoint(context, 100, 120);
    CGContextAddLineToPoint(context, 100, 300);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

// 画矩形：
-(void)test3 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(100, 100, 150, 150));
//    CGContextStrokePath(context);
    // 填充：
    CGContextFillPath(context);
}

@end
