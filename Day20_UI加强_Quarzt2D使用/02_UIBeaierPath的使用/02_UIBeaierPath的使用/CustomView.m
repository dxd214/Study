//
//  CustomView.m
//  02_UIBeaierPath的使用
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
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 200)];
    
#warning 此处必须将UIBezierPath类型的path转换为CGPath。
    
    CGContextAddPath(context, path.CGPath);
    // 渲染：
    CGContextDrawPath(context, kCGPathFill);
}

// 方法2:
-(void)test2 {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 200, 200)];
    [path fill];
}

@end
