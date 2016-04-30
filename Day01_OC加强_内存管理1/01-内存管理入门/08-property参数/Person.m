//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    [_car release];
    [super dealloc];
    NSLog(@"人死了....");
}

-(void)drive
{
    [self.car run];
}

@end
