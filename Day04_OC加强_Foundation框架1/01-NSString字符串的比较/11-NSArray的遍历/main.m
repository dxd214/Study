//
//  main.m
//  11-NSArray的遍历
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@"one", @"two", @"three", @1, @2, @3];
        
        /**
         *  遍历数组：
         */
        // 方法一：
        for (int i = 0; i < array.count; i++) {
            NSLog(@"%@", array[i]);
        }
        
        NSLog(@"--------------------------------------");
        
        // 方法二：forin
        for (NSObject *obj in array) {
            NSLog(@"%@", obj);
        }
        
        NSLog(@"--------------------------------------");
        
        // 方法三：block访问法：
        /**
         *  block访问法：
         *
         *  @param obj  数组元素
         *  @param idx  元素下标
         *  @param stop 是否停止
         *
         *  @return
         */
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 2) {
                *stop = YES;
            }
            NSLog(@"obj = %@, idx = %lu", obj, idx);
        }];
    }
    return 0;
}
