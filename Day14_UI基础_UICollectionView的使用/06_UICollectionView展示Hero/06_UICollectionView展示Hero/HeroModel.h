//
//  HeroModel.h
//  06_UICollectionView展示Hero
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *intro;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)heroWithDict:(NSDictionary *)dict;
+(NSArray *)herosArray;

@end
