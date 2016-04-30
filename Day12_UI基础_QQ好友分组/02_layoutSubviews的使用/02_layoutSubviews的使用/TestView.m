//
//  TestView.m
//  02_layoutSubviews的使用
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"%s", __func__);
}

@end
