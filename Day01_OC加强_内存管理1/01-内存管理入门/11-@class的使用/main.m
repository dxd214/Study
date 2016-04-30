//
//  main.m
//  11-@class的使用
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 假如有1000个类用#import的方式导入头文件，一旦这个头文件的里内容发生了改变，那么这1000个类都要重新编译一次，这样效率不高。
 
 用@class的方式，仅仅只是告诉编译器声明了一个类，但这个类中到底有什么内容，暂时不去检查。也就是说即使声明的这个类发生变化，也不会立即编译。
 
 用@class可以结局循环引用问题。
 */

#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        Car *car = [Car new];
        [person setCar:car];
        
        [person release];
        [car release];
    }
    return 0;
}
