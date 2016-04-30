//
//  main.m
//  12-循环retain问题
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

/**
 防止循环reatin的方法：
 1、让其中一个对象进行两次release；
 2、一端使用assign，一端使用retain；
 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        Dog *dog = [Dog new];
        
        /**
         *  此操作后引起循环retain问题：
         */
        person.dog = dog;
        dog.owner = person;
        
        [person release];
        [dog release];
//        [dog release];
    }
    return 0;
}
