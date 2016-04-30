//
//  AppModel.h
//  08_异步下载图片
//
//  Created by Chiang on 16/2/23.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;
@property (nonatomic, copy) NSString *name;

/**
 *  用于存储下载完成的图片:
 */
@property (nonatomic, strong) UIImage *iconImage;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;
+(NSArray *)appsArray;

@end
