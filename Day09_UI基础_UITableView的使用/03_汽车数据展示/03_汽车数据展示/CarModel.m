//
//  CarModel.m
//  03_汽车数据展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)carWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)carsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        CarModel *car = [self carWithDict:dict];
        [tempArray addObject:car];
    }
    
    return tempArray;
}

@end
