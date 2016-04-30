//
//  CustomView.m
//  02_图片剪裁
//
//  Created by Chiang on 16/3/7.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 需要剪裁的途径：
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CGContextAddPath(context, path.CGPath);
    
    // 执行剪裁：
    CGContextClip(context);
    // 加载图片：
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawAtPoint:CGPointZero];
}

@end
