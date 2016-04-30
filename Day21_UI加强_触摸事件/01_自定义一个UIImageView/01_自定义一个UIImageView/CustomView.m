//
//  CustomView.m
//  01_自定义一个UIImageView
//
//  Created by Chiang on 16/3/7.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

-(void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

-(void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

@end
