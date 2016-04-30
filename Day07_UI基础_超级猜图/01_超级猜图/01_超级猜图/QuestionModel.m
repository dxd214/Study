//
//  QuestionModel.m
//  01_超级猜图
//
//  Created by SteveChiang on 16/1/28.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "QuestionModel.h"

@implementation QuestionModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)questionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)questionsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictArray) {
        QuestionModel *question = [self questionWithDict:dict];
        [tempArray addObject:question];
    }
    return tempArray;
}

@end
