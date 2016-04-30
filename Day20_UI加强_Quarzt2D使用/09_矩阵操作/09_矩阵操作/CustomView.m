//
//  CustomView.m
//  09_矩阵操作
//
//  Created by Chiang on 16/3/6.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 缩放：
//    CGContextScaleCTM(context, 0.5, 0.5);
    // 旋转：
//    CGContextRotateCTM(context, M_PI_4);
    // 平移：
    CGContextTranslateCTM(context, 50, 200);
    
    // 在绘制之前保存当前上下文状体啊：
//    CGContextSaveGState(context);
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 200, 200)];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 100, 100, 100) cornerRadius:100];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(150, 150) radius:100 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    CGContextAddPath(context, path1.CGPath);
    CGContextAddPath(context, path2.CGPath);
    CGContextAddPath(context, path3.CGPath);
    
    [[UIColor redColor] set];
    CGContextSetLineWidth(context, 20);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    // 在下一次绘制前，替换当前图形上下文：
//    CGContextRestoreGState(context);
    
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    CGContextAddPath(context, path4.CGPath);
    CGContextDrawPath(context, kCGPathStroke);
}

@end
