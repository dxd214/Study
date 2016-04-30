//
//  main.m
//  07-ARC下多个对象的内存管理
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [Dog new];
        Person *person = [Person new];
        person.dog = dog;
        
        dog = nil;
        /**
         *  如果为strong，那么会有两个强指针指向_dog，一个是dog，一个是person，即使dog为nil，那么也还剩一个person强指针 
         */
        
        
    }
    return 0;
}
