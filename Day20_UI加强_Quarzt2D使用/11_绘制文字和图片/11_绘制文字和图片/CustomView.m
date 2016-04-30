//
//  CustomView.m
//  11_绘制文字和图片
//
//  Created by Chiang on 16/3/6.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    [self test2:rect];
}

-(void)test1 {
    NSString *str = @"YaoMing";
    
    [str drawAtPoint:CGPointMake(100, 100) withAttributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:20.f]}];
}

-(void)test2:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"me"];
//    [image drawAsPatternInRect:rect];
    [image drawInRect:rect];
}

@end
