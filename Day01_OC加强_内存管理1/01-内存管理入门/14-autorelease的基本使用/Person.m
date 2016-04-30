//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/20.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)run
{
    NSLog(@"run....");
}

-(void)dealloc
{
    [super dealloc];
    NSLog(@"person dealloc...");
}

@end
