//
//  main.m
//  04-ARC的概念和原理
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 ARC底层其实就是封装的MRC，知识不需要开发者自行retain和release；
 ARC判断的准则：只要这个对象没有强指针指向(strong)，那么这个对象就会立即被释放。
 假如一个对象同时有强指针和弱指针两个指针指向它，那么也不会被立即释放。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
