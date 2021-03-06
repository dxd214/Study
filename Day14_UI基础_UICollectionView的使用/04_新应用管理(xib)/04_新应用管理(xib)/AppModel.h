//
//  AppModel.h
//  04_新应用管理(xib)
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;
+(NSArray *)appsArray;

@end
