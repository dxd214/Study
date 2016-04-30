//
//  Person.m
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)needHouse
{
    NSLog(@"student need house.....");
    [self.delegate findHouse];
}

@end
