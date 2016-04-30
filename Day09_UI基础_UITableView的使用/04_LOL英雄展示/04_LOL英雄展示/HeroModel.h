//
//  HeroModel.h
//  04_LOL英雄展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)heroWithDict:(NSDictionary *)dict;
+(NSArray *)herosArray;

@end
