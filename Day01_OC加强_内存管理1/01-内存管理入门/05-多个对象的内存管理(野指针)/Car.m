//
//  Car.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Car.h"

@implementation Car

-(void)run
{
    NSLog(@"车正以%d的速度在跑...", _speed);
}

-(void)setSpeed:(int)speed
{
    _speed = speed;
}

-(void)dealloc
{
    [super dealloc];
    NSLog(@"车毁了....");
}

@end
