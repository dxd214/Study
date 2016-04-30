//
//  CustomView.m
//  08_绘制下载进度条
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

#define RectWidth rect.size.width
#define RectHeight rect.size.height

@implementation CustomView

-(UILabel *)progressLabel {
    if (!_progressLabel) {
        _progressLabel = [[UILabel alloc] init];
        [_progressLabel setTextColor:[UIColor blackColor]];
        _progressLabel.font = [UIFont systemFontOfSize:20.0f];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_progressLabel];
    }
    return _progressLabel;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = 50;
    self.progressLabel.frame = CGRectMake(0, 0, width, height);
    self.progressLabel.center = CGPointMake(width * 0.5, self.bounds.size.height * 0.5);
}

-(void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(RectWidth * 0.5, RectHeight * 0.5);
    CGFloat radius = MIN(RectWidth, RectHeight) * 0.5;
    CGFloat start = -M_PI * 0.5;
    CGFloat end = 2 * M_PI * self.progress + start;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor yellowColor] set];
    
    [path fill];
}

-(void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%", progress];
    [self setNeedsDisplay];
}

@end
