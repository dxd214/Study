//
//  CarGroupModel.h
//  06_汽车数据升级
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroupModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *cars;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carGroupWithDict:(NSDictionary *)dict;
+(NSArray *)carGroupsArray;

@end
