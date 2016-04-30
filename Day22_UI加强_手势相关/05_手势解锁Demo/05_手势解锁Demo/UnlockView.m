//
//  UnlockView.m
//  05_手势解锁Demo
//
//  Created by Chiang on 16/3/10.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "UnlockView.h"

#define kCol 3

@interface UnlockView ()

@property (nonatomic, strong) NSMutableArray *btnsArray;

@property (nonatomic, assign) CGPoint currentPoint;

@end

@implementation UnlockView

-(NSMutableArray *)btnsArray {
    if (!_btnsArray) {
        _btnsArray = [NSMutableArray array];
    }
    return _btnsArray;
}

-(void)awakeFromNib {
    CGFloat btnWidth = 74;
    CGFloat btnHeight = btnWidth;
    CGFloat margin = (self.frame.size.width - btnWidth * kCol) * 0.5;
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    NSInteger col = 0;
    NSInteger row = 0;
    
    // 创建按钮：
    for (int i = 0; i < 9; i++) {
        col = i / kCol;
        row = i % kCol;
        btnX = col * btnWidth + margin * col;
        btnY = row * btnHeight + margin * row;

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        [self addSubview:btn];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        btn.tag = i;
        btn.userInteractionEnabled = NO;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view];
    
    // 判断点是否在按钮内：
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, locPoint) && btn.selected == NO) {
            btn.selected = YES;
            [self.btnsArray addObject:btn];
            
            break;
        }
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
    UITouch *touch = touches.anyObject;
    self.currentPoint = [touch locationInView:touch.view];
    
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.currentPoint = [[self.btnsArray lastObject] center];
    [self setNeedsDisplay];
    
    // 获取密码：
    NSMutableString *password = [NSMutableString string];
    for (UIButton *btn in self.btnsArray) {
        [password appendFormat:@"%ld", btn.tag];
    }
    NSLog(@"%@", password);
    
    if ([self.delegate respondsToSelector:@selector(unlockViewGetPassWordWithUnlockView:andPassword:)]) {
        [self.delegate unlockViewGetPassWordWithUnlockView:self andPassword:password];
    }
    
    for (UIButton *btn in self.btnsArray) {
        btn.selected = NO;
    }
    [self.btnsArray removeAllObjects];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    if (self.btnsArray.count == 0) {
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 20;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [[UIColor whiteColor] set];
    
    for (int i = 0; i < self.btnsArray.count; i++) {
        UIButton *btn = self.btnsArray[i];
        // 获取按钮中心点：
        CGPoint btnCenter = btn.center;
        
        if (i == 0) {
            [path moveToPoint:btnCenter];
        } else {
            [path addLineToPoint:btnCenter];
        }
    }
    [path addLineToPoint:self.currentPoint];
    
    [path stroke];

}

@end
