//
//  main.m
//  06-集合对象的内存管理
//
//  Created by SteveChiang on 16/1/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        
        [person retain];
        
        NSLog(@"perosn.retainCount = %ld", person.retainCount);
        
        NSMutableArray *array = [NSMutableArray array];
        
        /**
         *  只要把对象加入数组，那么这个对象的引用计数就会＋1:
         */
        [array addObject:person];
        NSLog(@"perosn.retainCount = %ld", person.retainCount);
        
        /**
         *  一旦数组销毁后，那么这个数组中的对象也会进行一次release操作：
         */
        /**
         *  数组销毁后，里边的对象不一定销毁，根据对象的引用计数来判断：
         */
        
        [person release];
        NSLog(@"perosn.retainCount = %ld", person.retainCount);
        
        /**
         *  这个操作也会像数组中的所有对象进行一次release：
         */
        [array release];
        NSLog(@"perosn.retainCount = %ld", person.retainCount);
    }
    return 0;
}
