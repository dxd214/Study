//
//  main.m
//  04-NSRange的使用
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  NSRange是一个结构体，包含length和location。
         */
        NSRange range; // 变量。
        NSRange *r; // 结构体指针。
        
        range.length = 3;
        range.location = 5;
        
        range = (NSRange){3, 5};
        NSRange r2 = {3, 5};
        
        NSRange r3 = NSMakeRange(3, 5);
        
        // 转换成NSString类型：
        NSString *str = NSStringFromRange(r3);
        NSLog(@"%@", str);
    }
    return 0;
}
