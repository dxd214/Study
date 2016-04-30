//
//  main.m
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/16.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        NSUInteger count = person.retainCount;
        NSLog(@"person的引用计数为：%ld", count);
        
        /**
         *  此情况下引用计数依然为1：
         */
        Person *person2 = person;
        NSLog(@"person:%ld -- person2:%ld", person.retainCount, person2.retainCount);
        
        /**
         *  此情况下引用计数为2：
         */
        person2 = [person retain];
        NSLog(@"person:%ld -- person2:%ld", person.retainCount, person2.retainCount);
        
        // 释放对象：
        [person release];
        NSLog(@"person:%ld -- person2:%ld", person.retainCount, person2.retainCount);
        
        [person2 release];
        NSLog(@"person:%ld -- person2:%ld", person.retainCount, person2.retainCount);
        
        /**
         *  因为person和person2指向同一块内存空间，person被释放了，person2同时也被释放。打开Xcode僵尸对象检测后，此处会报错。
         */
    }
    return 0;
}
