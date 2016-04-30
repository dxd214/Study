//
//  HeroModel.m
//  04_LOL英雄展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)herosArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        HeroModel *hero = [HeroModel heroWithDict:dict];
        [tempArray addObject:hero];
    }
    return tempArray;
}

@end
