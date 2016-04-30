//
//  Person.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

@property int age;
/**
    assign是直接赋值，相当于
    -(void)setCar:(Car *)car
    {
        _car = car
    }
    在setter方法被调用时，对象不会进行retain
    此写法不符合setter方法内存管理的原则，所以assign只用于基本数据类型。
    所以@property参数，基本类型用assgin，关联其他类型用retain / 不写。
 */
@property (nonatomic, retain) Car *car;

-(void)drive;

@end
