//
//  Person.m
//  01-沙盒的基本概念
//
//  Created by SteveChiang on 16/1/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    [super dealloc];
    NSLog(@"person dealloc...");
}

@end
