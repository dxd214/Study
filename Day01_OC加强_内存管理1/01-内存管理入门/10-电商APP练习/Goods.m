//
//  Goods.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Goods.h"

@implementation Goods

-(void)dealloc
{
    [super dealloc];
    [_productName release];
    [_productImage release];
    NSLog(@"goods dealloc...");
}

@end
