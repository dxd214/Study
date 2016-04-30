//
//  Person.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义性别枚举：
typedef enum {
    kSexMan,
    kSexWoman
} MySex;

@interface Person : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) MySex sex;
@property (nonatomic, assign) int age;
@property (nonatomic, assign) float height;

@end
