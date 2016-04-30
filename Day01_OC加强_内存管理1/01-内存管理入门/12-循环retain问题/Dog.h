//
//  Dog.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Dog : NSObject

@property (nonatomic, retain) Person *owner;

@end
