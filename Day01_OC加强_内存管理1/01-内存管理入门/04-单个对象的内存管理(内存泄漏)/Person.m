//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)drive
{
    [_car run];
}

-(void)dealloc
{
    [super dealloc];
    [_car release];
    NSLog(@"人死了....");
}

-(void)setCar:(Car *)car
{
    _car = [car retain];
}

@end
