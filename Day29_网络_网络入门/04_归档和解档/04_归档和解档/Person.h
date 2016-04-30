//
//  Person.h
//  04_归档和解档
//
//  Created by Chiang on 16/2/25.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;

@end
