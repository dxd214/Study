//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/17.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    [super dealloc];
    NSLog(@"%@死了....", self);
}

@end
