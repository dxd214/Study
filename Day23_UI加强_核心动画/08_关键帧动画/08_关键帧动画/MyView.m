//
//  MyView.m
//  08_关键帧动画
//
//  Created by Chiang on 16/3/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 300, 600)];
    [path stroke];
}

@end
