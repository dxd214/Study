//
//  CustomView.m
//  05_绘图的渲染方式
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    [self test1];
}

-(void)test1 {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(50, 100, 200, 200));
    CGContextAddEllipseInRect(context, CGRectMake(100, 150, 100, 100));
    CGContextDrawPath(context, kCGPathFill);
}

@end
