//
//  Person.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)run
{
    NSLog(@"run...");
}

@end

@implementation Person (printNameAndAge)

-(void)printNameAndAge
{
    NSLog(@"name: %@ -- age:%d", _name, _age);
}

-(void)run
{
    NSLog(@"run run....");
}

@end
