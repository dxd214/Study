//
//  CustomView.m
//  04_绘图状态
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
//    [self test1];
    [self test2];
}

-(void)test1 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 200, 200);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextClosePath(context);
    CGContextSetLineWidth(context, 10);
    [[UIColor redColor] set];
    CGContextStrokePath(context);
}

-(void)test2 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 200)];
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
