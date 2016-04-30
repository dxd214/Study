//
//  AppModel.m
//  01_应用管理
//
//  Created by SteveChiang on 16/1/27.
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
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArray) {
        AppModel *app = [AppModel appWithDict:dict];
        [tempArray addObject:app];
    }
    return tempArray;
}

@end
