//
//  main.m
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 复习：写一个有参有返回值的block：
        int (^myBlock1)(int, int) = ^(int num1, int num2) {
            return num1 + num2;
        };
        // 使用block：
        int sum = myBlock1(5, 10);
        NSLog(@"sum = %d", sum);
        
        // 为void (^myBlock2)()起一个别名：
        // 此时myBlock1是一个类型而不是一个变量：
        typedef void (^myBlock2)();
        
        typedef int (^myBlock3)(int, int);
        // 定义新变量：
        myBlock3 mb1 = ^(int num1, int num2) {
            return num1 + num2;
        };
        int sum2 = mb1(5, 8);
        NSLog(@"sum2 = %d", sum2);
        
        myBlock3 mb2 = ^(int num1, int num2) {
            return num1 > num2 ? num1 : num2;
        };
        int max = mb2(8, 9);
        NSLog(@"max = %d", max);
    }
    return 0;
}
