//
//  main.m
//  01-NSString字符串的比较
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"abc";
        NSString *str2 = @"ABC";
        // 比较方法：去除每个自负的ASCII码值进行比较。
        
        // compare方法比较：
        // 区分大小写：
//        NSComparisonResult result = [str1 compare:str2];
        // 不区分大小写：
        NSComparisonResult result = [str1 compare:str2 options:NSCaseInsensitiveSearch];

        switch (result) {
            case NSOrderedAscending:
                NSLog(@"str1 < str2");
                break;
            case NSOrderedDescending:
                NSLog(@"str1 > str2");
                break;
            case NSOrderedSame:
                NSLog(@"str1 == str2");
                break;
            default:
                break;
        }
    }
    return 0;
}
