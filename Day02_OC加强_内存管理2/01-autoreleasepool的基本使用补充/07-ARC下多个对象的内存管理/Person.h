//
//  Person.h
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

/**
 *  ARC下不能用retain，只能用weak或strong：
 */
@property (nonatomic, weak) Dog *dog;

/**
 *  用weak等同于生成一个__weak _dog 的对象。
 */

@end
