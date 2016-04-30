//
//  AppModel.m
//  08_异步下载图片
//
//  Created by Chiang on 16/2/23.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)appsArray {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *appsArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        AppModel *app = [self appWithDict:dict];
        [appsArray addObject:app];
    }
    return appsArray;
}

@end
