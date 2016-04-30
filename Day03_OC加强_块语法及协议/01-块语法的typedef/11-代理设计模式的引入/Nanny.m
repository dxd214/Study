//
//  Nanny.m
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Nanny.h"
#import "Baby.h"

@implementation Nanny

-(void)feedBaby:(Baby *)baby
{
    NSLog(@"feed baby......");
    baby.blood += 10;
}

-(void)makeSleep:(Baby *)baby
{
    NSLog(@"make sleep.....");
    baby.blood += 50;
}

@end
