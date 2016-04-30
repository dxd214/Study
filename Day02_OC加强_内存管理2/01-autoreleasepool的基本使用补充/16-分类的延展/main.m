//
//  main.m
//  16-分类的延展
//
//  Created by SteveChiang on 15/12/23.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 延展也叫类扩展，可以增加私有的变量和方法，无法被子类继承。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        person.age = 18;
        person.weight = 120;
        person.food = @"沙拉";
        [person printInfo];
        
        [person test];
    }
    return 0;
}
