//
//  DrawingBoardView.h
//  04_画板Demo
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawingBoardView : UIView

// 线宽度：
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor *lineColor;

-(void)clearDisplay;
-(void)comeBack;
-(void)useRubber;

@end
