//
//  FriendsGroupModel.m
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "FriendsGroupModel.h"
#import "FriendModel.h"

@implementation FriendsGroupModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *friendsArray = [NSMutableArray array];
        NSArray *dictsArray = self.friends;
        
        for (NSDictionary *dict in dictsArray) {
            FriendModel *friend = [FriendModel friendWithDict:dict];
            [friendsArray addObject:friend];
        }
        self.friends = friendsArray;
    }
    return self;
}

+(instancetype)friendsGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)friendsGroupsArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *friendsGroupsArray = [NSMutableArray array];
    
    for (NSDictionary *dict in dictsArray) {
        FriendsGroupModel *friendsGroup = [FriendsGroupModel friendsGroupWithDict:dict];
        [friendsGroupsArray addObject:friendsGroup];
    }
    return friendsGroupsArray;
}

@end
