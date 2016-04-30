//
//  FriendModel.h
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    VipTypeYes,
    VipTypeNo
} VipType;

@interface FriendModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, assign) VipType vip;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendWithDict:(NSDictionary *)dict;

@end
