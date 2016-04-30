//
//  CustomView.m
//  10_Quarzt2D内存管理
//
//  Created by Chiang on 16/3/6.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 创建子路径：
    CGMutablePathRef path = CGPathCreateMutable();
    // 创建子路径：
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    // 路径添加到上下文：
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    // 释放内存：
//    CGPathRelease(path);
    CFRelease(path);
}

@end
