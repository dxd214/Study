//
//  main.m
//  04-单个对象的内存管理(内存泄漏)
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        Car *car = [[Car alloc] init];
        
        [car setSpeed:100];
        [person setCar:car];
        [person drive];
        
        NSLog(@"car.retainCount == %ld", car.retainCount);
        NSLog(@"person.retainCount == %ld", person.retainCount);
        
        /**
         *  要确保perosn对象没被销毁前，car对象也可用：
         *  在setter方法中先将car进行一次retain，然后再赋值给person。
         *  在person的dealloc方法中对car进行一次release。
         */
        
        [car release];
        [person release];
    }
    return 0;
}
