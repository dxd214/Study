//
//  Person.h
//  02_KVC的使用
//
//  Created by SteveChiang on 16/2/3.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end
