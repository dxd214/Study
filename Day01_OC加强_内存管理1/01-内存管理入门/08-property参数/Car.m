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
    NSLog(@"车在跑...");
}

-(void)dealloc
{
    [super dealloc];
    NSLog(@"速度为%d的车毁了....", _speed);
}

@end
