//
//  HeroModel.m
//  06_UICollectionView展示Hero
//
//  Created by Chiang on 16/2/13.
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
    NSMutableArray *herosArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        HeroModel *hero = [self heroWithDict:dict];
        [herosArray addObject:hero];
    }
    return herosArray;
}

@end
