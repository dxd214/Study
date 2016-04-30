//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    [super dealloc];
    [_name release];
    NSLog(@"person dealloc...");
}

@end
