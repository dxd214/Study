//
//  MessageModel.h
//  01_QQ聊天界面
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    MessageTypeSelf,
    MessageTypeOther
} MessageType;

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) MessageType type;
@property (nonatomic, assign, getter=isTimeHidden) BOOL timeHidden;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)messageWithDict:(NSDictionary *)dict;
+(NSMutableArray *)messageFramesArray;

@end
