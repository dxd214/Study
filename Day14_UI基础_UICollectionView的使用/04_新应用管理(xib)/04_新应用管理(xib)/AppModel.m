//
//  AppModel.m
//  04_新应用管理(xib)
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)appsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *appsArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        AppModel *app = [self appWithDict:dict];
        [appsArray addObject:app];
    }
    return appsArray;
}

@end
