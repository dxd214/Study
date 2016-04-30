//
//  ImageCell.m
//  02_堆栈式相册
//
//  Created by Chiang on 16/2/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s", __func__);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = [UIImage imageNamed:@"zilong"];
        [self addSubview:imageView];
    }
    return self;
}

@end
