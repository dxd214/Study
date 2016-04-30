//
//  Person.m
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)eat
{
    NSLog(@"perosn eat....");
}

-(void)playBasketball
{
    NSLog(@"playBasketball....");
}

/**
 *  默认为必须实现：
 */
-(void)run
{
    NSLog(@"run....");
}

@end
