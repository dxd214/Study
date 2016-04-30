//
//  CustomView.m
//  07_画柱状图
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation CustomView

-(NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@450, @210.65, @97.3, @507.3, @175.4, @45];
    }
    return _dataArray;
}

-(void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width / (self.dataArray.count * 2 - 1);
    NSLog(@"%@", self.dataArray);

    CGFloat height = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    
    for (int i = 0; i < self.dataArray.count; i++) {
        x = 2 * width * i;
        height = [self.dataArray[i] floatValue] / 1000 * rect.size.height;
        y = rect.size.height - height;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, width, height)];
        [[self randomColor] set];
        [path fill];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

-(UIColor *)randomColor {
    NSInteger red = arc4random_uniform(256);
    NSInteger blue = arc4random_uniform(256);
    NSInteger green = arc4random_uniform(256);
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0f];
}

@end
