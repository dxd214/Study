//
//  Dog.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/17.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc
{
    [super dealloc];
    NSLog(@"狗带....");
}

@end
