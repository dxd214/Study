//
//  FriendsGroupModel.h
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendsGroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger online;
@property (nonatomic, strong) NSArray *friends;

@property (nonatomic, assign, getter=isFoldaway) BOOL foldaway;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsGroupWithDict:(NSDictionary *)dict;
+(NSArray *)friendsGroupsArray;

@end
