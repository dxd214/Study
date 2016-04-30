//
//  main.m
//  04-block作为函数的返回值
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  定义一个block类型的变量：
 */
typedef void (^newType)();
/**
 *  有参有返回值的block：
 *
 *  @param int 数字
 *  @param int 数字
 *
 *  @return 两个数的和
 */
typedef int (^getSum)(int, int);

/**
 *  打印一句话的函数：
 *
 *  @return block
 */
newType test()
{
    return ^() {
        NSLog(@"YaoMing Fuck Howard");
    };
}

getSum test2()
{
    return ^(int num1, int num2) {
        return num1 + num2;
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 调用函数拿到一个newType类型的block：
        newType type = test();
        // 执行block：
        type();
        
        getSum sum = test2();
        int result = sum(5, 8);
        NSLog(@"result = %d", result);
    }
    return 0;
}
