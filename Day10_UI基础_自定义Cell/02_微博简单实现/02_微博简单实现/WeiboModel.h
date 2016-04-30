//
//  WeiboModel.h
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger)
{
    VipTypeYes,
    VipTypeNo
} VipType;

@interface WeiboModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) VipType vip;
@property (nonatomic, copy) NSString *picture;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)weiboWithDict:(NSDictionary *)dict;
+(NSArray *)weiboFramesArray;

@end
