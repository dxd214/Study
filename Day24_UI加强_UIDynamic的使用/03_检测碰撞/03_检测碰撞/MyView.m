//
//  MyView.m
//  03_检测碰撞
//
//  Created by Chiang on 16/3/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = 120;
    CGFloat start = 0;
    CGFloat end = 2 * M_PI;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    [path stroke];
}

@end
