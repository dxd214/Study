//
//  main.m
//  08-协议的其他用法
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"
#import "Person.h"
#import "Student.h"

/**
 一个协议可以遵守其他协议；
 一个类可以遵守多个协议；
 一个协议可以被多个类遵守。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        Cat *cat = [Cat new];
        
        [person run];
        [cat run];
        
        Student *student = [Student new];
        [student run];
    }
    return 0;
}
