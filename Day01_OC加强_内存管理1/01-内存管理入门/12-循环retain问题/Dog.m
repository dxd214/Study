//
//  Dog.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog

-(void)dealloc
{
    [super dealloc];
    [_owner release];
    NSLog(@"dog dealloc...");
}

@end
