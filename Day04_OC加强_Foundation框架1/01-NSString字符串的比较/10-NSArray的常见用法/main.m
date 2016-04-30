//
//  main.m
//  10-NSArray的常见用法
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void test()
{
    NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @23, nil];
    // 获取数组长度：
    NSLog(@"array中有%ld个元素", array.count);
    
    // 根据下标查找对象：
    NSLog(@"下标为1的元素为：%@", [array objectAtIndex:1]);
    
    // 返回元素的下标：
    NSUInteger loc = [array indexOfObject:@"two"];
    NSLog(@"two在数组的%lu个位置", loc);
    
    // 判断数组中是否包含某个元素：
    if ([array containsObject:@"one"]) {
        NSLog(@"包含...");
    } else {
        NSLog(@"不包含...");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  简化方式定义数组：
         */
        NSArray *array = @[@"one", @"two", @1, @2];
        NSLog(@"array = %@", array);
        
        // 访问数组元素：
        NSString *str = array[1];
        NSLog(@"%@", str);
    }
    return 0;
}
