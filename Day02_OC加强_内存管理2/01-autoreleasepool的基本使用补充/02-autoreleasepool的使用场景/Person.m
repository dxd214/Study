//
//  Person.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)person
{
    // 创建对象后立即加入自动释放池：
    return [[[self alloc] init] autorelease];
}

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
