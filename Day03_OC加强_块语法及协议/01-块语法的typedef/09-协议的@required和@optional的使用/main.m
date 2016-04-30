//
//  main.m
//  09-协议的@required和@optional的使用
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 @optional修饰的方法表示可选，@required修饰的方法表示必须实现，默认@required。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        [person run];
        [person eat];
        [person playBasketball];
    }
    return 0;
}
