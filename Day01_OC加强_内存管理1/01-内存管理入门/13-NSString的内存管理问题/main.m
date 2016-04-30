//
//  main.m
//  13-NSString的内存管理问题
//
//  Created by SteveChiang on 15/12/20.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 如果你需要的字符串在常量区已经存在了，则不会在重新分配内存空间。
        
        /**
         没有alloc －－ init或者new就不需要release
         
         */
        
        // str2和str4
        NSString *str1 = @"abc"; // 存储于常量区。
        NSString *str2 = [NSString stringWithFormat:@"aaa"];
        NSString *str3 = [NSString stringWithString:@"abc"]; // 常量区。
        NSString *str4 = [[NSString alloc] initWithString:@"abc"]; // 常量区。
        NSString *str5 = [[NSString alloc] initWithFormat:@"aaa"];
        NSString *str6 = [[NSString alloc] init];
        str6 = @"abc";
        
        NSLog(@"str1 == %@-%p-%ld", str1, str1, str1.retainCount);
        NSLog(@"str2 == %@-%p-%ld", str2, str2, str2.retainCount);
        NSLog(@"str3 == %@-%p-%ld", str3, str3, str3.retainCount);
        NSLog(@"str4 == %@-%p-%ld", str4, str4, str4.retainCount);
        NSLog(@"str5 == %@-%p-%ld", str5, str5, str5.retainCount);
        NSLog(@"str6 == %@-%p-%ld", str6, str6, str6.retainCount);
    }
    return 0;
}
