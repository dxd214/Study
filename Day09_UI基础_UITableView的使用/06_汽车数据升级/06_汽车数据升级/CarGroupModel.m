//
//  CarGroupModel.m
//  06_汽车数据升级
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CarGroupModel.h"
#import "CarModel.h"

@implementation CarGroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *carsArray = [NSMutableArray array];
        for (NSDictionary *dict in self.cars) {
            CarModel *car = [CarModel carWithDict:dict];
            [carsArray addObject:car];
        }
        self.cars = carsArray;
    }
    return self;
}

+(instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)carGroupsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *carGroupsArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        CarGroupModel *carGroup = [self carGroupWithDict:dict];
        [carGroupsArray addObject:carGroup];
    }
    
    return carGroupsArray;
}

@end
