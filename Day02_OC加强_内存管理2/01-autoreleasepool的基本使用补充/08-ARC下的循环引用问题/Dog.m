//
//  Dog.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void)dealloc
{
    NSLog(@"dog dealloc...");
}

@end
