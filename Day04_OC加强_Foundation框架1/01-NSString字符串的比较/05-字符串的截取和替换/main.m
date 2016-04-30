//
//  main.m
//  05-字符串的截取和替换
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  字符串的查找：
 */
void test()
{
    NSString *str = @"http://www.apple.com.cn";
    
    // 从某个位置开始，一直截取到最后（包含其实起始的字符）：
    NSString *str2 = [str substringFromIndex:7];
    NSLog(@"substringFromIndex -- %@", str2);
    
    // 从开始的位置，到某个位置结束（不包含这个位置的字符）：
    NSString *str3 = [str substringToIndex:7];
    NSLog(@"substringToIndex -- %@", str3);
    
    // 截取某一部分：
    NSString *str4 = [str substringWithRange:NSMakeRange(7, 3)];
    NSLog(@"substringWithRange -- %@", str4);
    
    /**
     *  截取出中间的"Fuck"。
     */
    NSString *str5 = @"LeBron_Fuck->Kobe";
    // 方法一：
    NSString *str6 = [str5 substringWithRange:NSMakeRange(7, 4)];
    NSLog(@"方法1： %@", str6);
    // 方法二：
    NSUInteger loc = [str5 rangeOfString:@"_"].location + 1;
    NSUInteger len = [str5 rangeOfString:@"-"].location - loc;
    
    NSString *str7 = [str5 substringWithRange:NSMakeRange(loc, len)];
    NSLog(@"方法2： %@", str7);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  字符串的替换：
         */
        NSString *str = @"James Fuck Kobe";
        NSLog(@"替换前：%@", str);
        str = [str stringByReplacingOccurrencesOfString:@"James" withString:@"YaoMing"];
        NSLog(@"替换后：%@", str);
        
        /**
         *  去掉空格：
         */
        NSString *str2 = @"aaa bbb ccc ddd eee fff ggg";
        NSLog(@"去掉空格前：%@", str2);
        str2 = [str2 stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSLog(@"去掉空格后：%@", str2);
    }
    return 0;
}
