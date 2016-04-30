//
//  Person.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)drive
{
    [_car run];
}

/**
 *  如果_car == car，表明二者是同一个对象，此时应该不做任何操作，倘若不是同一个对象，则表示需要重新赋值，此时应该将先前的_car里的对象给release掉，然后再重新赋值。
 *
 */
-(void)setCar:(Car *)car
{
    if (_car != car) {
        [_car release];
        _car = [car retain];
    }
}

-(void)dealloc
{
    [super dealloc];
    [_car release];
    NSLog(@"人死了...");
}

@end
