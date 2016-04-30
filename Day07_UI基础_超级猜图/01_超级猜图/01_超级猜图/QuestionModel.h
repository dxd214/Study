//
//  QuestionModel.h
//  01_超级猜图
//
//  Created by SteveChiang on 16/1/28.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray *options;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)questionWithDict:(NSDictionary *)dict;
+(NSArray *)questionsArray;

@end
