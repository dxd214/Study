//
//  CustomView.m
//  03_绘制基本图形
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5];
    [self test6];
}

-(void)test1 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(50, 300)];
    [path closePath];
    
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFillStroke);
}

-(void)test2 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 200)];
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFill);
}

// 绘制圆角矩形：
-(void)test3 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:20];
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFill);
}

// 画椭圆1：
-(void)test4 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(50, 50, 200, 200));
    CGContextStrokePath(context);
}

// 画椭圆2:
-(void)test5 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 200, 200) cornerRadius:100];
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFill);
}

// 通过画弧的方式绘制椭圆：
-(void)test6 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI_4 clockwise:NO];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path closePath];
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
