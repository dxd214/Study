//
//  main.m
//  07-协议的基本使用
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 协议：一些方法的声明，一般写在.h文件中。
 如果一个类遵守了某个协议，那么这个类必须实现这个协议中某些必须实现的方法。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        [person run];
        [person eat];
        [person work];
    }
    return 0;
}
