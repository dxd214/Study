//
//  MessageModel.m
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "MessageModel.h"
#import "MessageFrameModel.h"

@implementation MessageModel

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)messageWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+(NSMutableArray *)messageFramesArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *dictsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *messageFramesArray = [NSMutableArray array];
    
    MessageModel *lastMessage = nil;
    for (NSDictionary *dict in dictsArray) {
        MessageModel *message = [self messageWithDict:dict];
        if ([lastMessage.time isEqualToString:message.time]) {
            message.timeHidden = YES;
        }
        MessageFrameModel *messageFrameModel = [[MessageFrameModel alloc] init];
        messageFrameModel.message = message;
        
        [messageFramesArray addObject:messageFrameModel];
        lastMessage = message;
    }
    return messageFramesArray;
}

@end
