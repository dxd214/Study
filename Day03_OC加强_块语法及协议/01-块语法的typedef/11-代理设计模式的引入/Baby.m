//
//  Baby.m
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Baby.h"
#import "Nanny.h"

@implementation Baby

-(void)wantToEat
{
    NSLog(@"555555555555....want to eat.....");
    [self.nanny feedBaby:self];
    NSLog(@"eat blood = %d", self.blood);
}

-(void)wantToSleep
{
    NSLog(@"555555555555....want to sleep....");
    [self.nanny makeSleep:self];
    NSLog(@"sleep blood = %d", self.blood);
}

@end
