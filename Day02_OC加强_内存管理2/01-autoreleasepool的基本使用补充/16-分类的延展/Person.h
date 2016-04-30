//
//  Person.h
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/23.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *food;

-(void)printInfo;
-(void)test;

@end

/**
 *  延展是特殊的分类。
    1、可以在延展中定义实例变量；
    2、允许声明方法，但不能实现，且定义的方法是私有方法。
 */
@interface Person ()

@property (nonatomic, assign) float weight;

@end
