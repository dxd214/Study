//
//  main.m
//  03-NSString前后缀检查及搜索
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"https://www.apple.com.cn";
        /**
         *  检测网址开头是否为"http"或者"https":
         */
//        BOOL result = [str1 hasPrefix:@"http"];
        if ([str1 hasPrefix:@"http"] || [str1 hasPrefix:@"https"]) {
            NSLog(@"Yes...");
        } else {
            NSLog(@"No...");
        }
        
        /**
         *  判断图片后缀是否为jpg：
         */
        NSString *str2 = @"LinZhiLing.mp4";
//        BOOL result = [str2 hasSuffix:@".jpg"];
        
        if ([str2 hasSuffix:@".jpg"] || [str2 hasSuffix:@".png"] || [str2 hasSuffix:@".gif"]) {
            NSLog(@"Yes...");
        } else {
            NSLog(@"No...");
        }
        
        /**
         *  字符串的查找：查找某个字符串在另一个字符串中首次出现的位置。
         */
        NSString *str3 = @"YaoMing Fuck Kobe And James";
        NSString *str4 = @"Kobe";
        
        NSRange range = [str3 rangeOfString:str4];
        NSLog(@"查找的字符串长度为：%ld", range.length);
        NSLog(@"查找字符串首次出现的位置为：%ld", range.location);
    }
    return 0;
}
