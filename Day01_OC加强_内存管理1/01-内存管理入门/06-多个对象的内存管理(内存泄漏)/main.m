//
//  main.m
//  06-多个对象的内存管理(内存泄漏)
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        Car *car = [Car new];
        [car setSpeed:120];
        [person setCar:car];
        
        [person drive];
        
        [car release];
        
        //        [person drive]; // 野指针访问。
        
        [person release];
    }
    return 0;
}
