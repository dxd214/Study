//
//  ProvinceModel.m
//  02_城市选择
//
//  Created by Chiang on 16/2/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ProvinceModel.h"

@implementation ProvinceModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)provinceWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)provincesArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"02cities.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *provincesArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        ProvinceModel *province = [self provinceWithDict:dict];
        [provincesArray addObject:province];
    }
    return provincesArray;
}

@end
