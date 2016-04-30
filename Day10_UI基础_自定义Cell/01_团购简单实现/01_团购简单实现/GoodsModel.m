//
//  GoodsModel.m
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)goodsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSMutableArray *)goodsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *goodsArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        GoodsModel *goods = [self goodsWithDict:dict];
        [goodsArray addObject:goods];
    }
    return goodsArray;
}

@end
