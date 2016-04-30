//
//  GoodsModel.h
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)goodsWithDict:(NSDictionary *)dict;
+(NSMutableArray *)goodsArray;

@end
