//
//  CarModel.h
//  03_汽车数据展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, strong) NSArray *cars;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carWithDict:(NSDictionary *)dict;
+(NSArray *)carsArray;

@end
