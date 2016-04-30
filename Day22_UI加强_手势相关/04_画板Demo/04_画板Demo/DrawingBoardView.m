//
//  DrawingBoardView.m
//  04_画板Demo
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "DrawingBoardView.h"
#import "CustomBezierPath.h"

@interface DrawingBoardView ()

//@property (nonatomic, strong) UIBezierPath *drawingPath;

// 用数组存储创建的path，保证始终只有一个path：
@property (nonatomic, strong) NSMutableArray *pathsArray;

@end

@implementation DrawingBoardView

-(NSMutableArray *)pathsArray {
    if (!_pathsArray) {
        _pathsArray = [NSMutableArray array];
    }
    return _pathsArray;
}

// 点击：
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象：
    UITouch *touch = touches.anyObject;
    // 获取触摸点：
    CGPoint locationPoint = [touch locationInView:touch.view];
    
    // 创建绘图路径：
    CustomBezierPath *drawingPath = [[CustomBezierPath alloc] init];
    drawingPath.lineWidth = self.lineWidth;
    drawingPath.lineColor = self.lineColor;
    [self.pathsArray addObject:drawingPath];
    // 添加子路径：
    [drawingPath moveToPoint:locationPoint];
}

// 移动：
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取触摸对象：
    UITouch *touch = touches.anyObject;
    // 获取触摸点：
    CGPoint locationPoint = [touch locationInView:touch.view];
    CustomBezierPath *path = [self.pathsArray lastObject];
    [path addLineToPoint:locationPoint];
    
    [self setNeedsDisplay];
}

// 手指抬起：
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

-(void)drawRect:(CGRect)rect {
    for (CustomBezierPath *path in self.pathsArray) {
        // 头样式：
        path.lineCapStyle = kCGLineCapRound;
        // 连接处样式：
        path.lineJoinStyle = kCGLineCapRound;
        // 设置颜色：
        [path.lineColor set];
        
        [path stroke];
    }
}

-(void)clearDisplay {
    [self.pathsArray removeAllObjects];
    [self setNeedsDisplay];
}

-(void)comeBack {
    [self.pathsArray removeLastObject];
    [self setNeedsDisplay];
}

-(void)useRubber {
    self.lineColor = self.backgroundColor;
}

@end
