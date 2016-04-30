//
//  CustomView.m
//  06_画饼状图
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

#define RectSizeWidth rect.size.width
#define RectSizeHeight rect.size.height

@interface CustomView ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CustomView

-(void)drawRect:(CGRect)rect {
//    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat start = 0;
    CGFloat end = 0;
    CGPoint center = CGPointMake(RectSizeWidth * 0.5, RectSizeHeight * 0.5);
    
    for (int i = 0; i < self.dataArray.count; i++) {
        CGFloat data = ([self.dataArray[i] floatValue] / 100 * 2 * M_PI) + start;
        end = data;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:MIN(RectSizeWidth, RectSizeHeight) * 0.5 startAngle:start endAngle:end clockwise:YES];
        [[self randomColor] set];
        [path addLineToPoint:center];
        [path fill];
        
        start = end;
    }
    
    NSLog(@"%@", self.dataArray);

//    CGContextDrawPath(context, kCGPathFill);
}

// 执行重绘：
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

-(UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256);
    CGFloat blue = arc4random_uniform(256);
    CGFloat green = arc4random_uniform(256);
    
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
    return color;
}

-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@23, @19, @31, @7, @15, @5];
    }
    return _dataArray;
}

@end
