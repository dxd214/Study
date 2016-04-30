//
//  Student.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype)initWithAge:(int)age
{
    if (self = [super init]) {
        _age = age;
    }
    return [self autorelease];
}

+(instancetype)studentWithAge:(int)age
{
    return [[self alloc] initWithAge:age];
}

-(void)dealloc
{
    [super dealloc];
    NSLog(@"%@ dealloc...", self);
}

@end
