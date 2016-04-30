//
//  Person.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/23.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"
#import "Person_Eat.h"

@implementation Person

-(void)printInfo
{
    NSLog(@"年龄：%d -- 体重：%f", _age, _weight);
}

-(void)eat
{
    NSLog(@"eat %@", _food);
}

/**
 *  eat为私为私有方法，所以不能用直接调用。
 */
-(void)test
{
    [self eat];
}

@end
