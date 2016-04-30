//
//  main.m
//  09-NSArray的基本使用
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 不可变数组：
        NSArray *array1 = [NSArray array];
        NSLog(@"array1 = %@", array1);
        
        // 有一个元素：
        NSArray *array2 = [NSArray arrayWithObject:@"YaoMing"];
        NSLog(@"array2 = %@", array2);
        
        // 有多个元素：
        NSArray *array3 = [NSArray arrayWithObjects:@"one", @"two", nil];
        NSLog(@"array3 = %@", array3);
        
        // 对象方法：
        NSArray *array4 = [[NSArray alloc] initWithObjects:@"one", @"two", nil];
        NSLog(@"array4 = %@", array4);
        
        // 用数组创建另一个数组：
        NSArray *array5 = [NSArray arrayWithArray:array3];
        NSLog(@"array5 = %@", array5);
        
        // nil的用法：
        /**
         *  注：nil不能存在于数组中，否则编译器会认为数组的赋值已经结束。如果nil后边还有值的话，是无法存入数组的。
         */
        NSArray *array6 = [NSArray arrayWithObjects:@"Yao", nil, @"Ming", @"Yi", nil];
        NSLog(@"array6 = %@", array6);
    }
    return 0;
}
