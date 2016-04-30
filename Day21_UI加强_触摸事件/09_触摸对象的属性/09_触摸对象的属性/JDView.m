//
//  JDView.m
//  09_触摸对象的属性
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "JDView.h"

@implementation JDView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view.superview];
    
    self.center = locPoint;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint locPoint = [touch locationInView:touch.view.superview];
    
    self.center = locPoint;
}

@end
