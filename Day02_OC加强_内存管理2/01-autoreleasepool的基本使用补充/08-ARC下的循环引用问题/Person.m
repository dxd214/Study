//
//  Person.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)dealloc
{
    NSLog(@"person dealloc...");
}

@end
