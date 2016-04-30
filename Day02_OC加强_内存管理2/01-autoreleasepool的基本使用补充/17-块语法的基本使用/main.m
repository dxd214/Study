//
//  main.m
//  17-块语法的基本使用
//
//  Created by SteveChiang on 15/12/23.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  无参无返回值的block：
         */
        void (^myBlock1)() = ^() {
            NSLog(@"无参无返回值的block....");
        };
        // 执行代码块中的了类容：
        myBlock1();
        
        /**
         *  有参无返回值：
         */
        void (^myBlock2)(int, int) = ^(int num1, int num2) {
            NSLog(@"num1 + num2 = %d", num1 + num2);
        };
        // 括号内写参数：
        myBlock2(5, 8);
        
        /**
         *  给myBlock2重新赋值：
         */
        myBlock2 = ^(int x, int y) {
            int result = x > y ? x : y;
            NSLog(@"%d较大", result);
        };
        myBlock2(10, 11);
        
        /**
         *  有参数有返回值：
         */
        int (^myBlock3)(int, int) = ^(int a, int b) {
            return a + b;
        };
        int sum = myBlock3(5, 5);
        NSLog(@"a + b = %d", sum);
    }
    return 0;
}
