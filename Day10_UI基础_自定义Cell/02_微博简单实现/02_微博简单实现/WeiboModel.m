//
//  WeiboModel.m
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "WeiboModel.h"
#import "WeiboFrameModel.h"

@implementation WeiboModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)weiboFramesArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *weibosArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        WeiboModel *weibo = [self weiboWithDict:dict];
        WeiboFrameModel *weiboFrameModel = [[WeiboFrameModel alloc] init];
        weiboFrameModel.weibo = weibo;
        
        [weibosArray addObject:weiboFrameModel];
    }
    return weibosArray;
}

@end
