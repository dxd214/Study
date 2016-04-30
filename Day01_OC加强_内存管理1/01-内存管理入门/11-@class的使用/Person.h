//
//  Person.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;

@interface Person : NSObject

@property (nonatomic, retain) Car *car;

@end
