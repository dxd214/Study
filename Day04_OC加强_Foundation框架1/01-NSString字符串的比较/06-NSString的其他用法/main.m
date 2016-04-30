//
//  main.m
//  06-NSString的其他用法
//
//  Created by SteveChiang on 15/12/26.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"3";
        NSString *str2 = @"3.14";
        
        int a = 10;
        int b = [str1 intValue];
        float c = [str2 floatValue];
        NSLog(@"%.2f", c);
        
        a += b;
        NSLog(@"a + b = %d", a);
        
        // oc字符串和c的字符串互相转换：
        char *s ="yaoming";
        printf("%s\n", s);
        
        // c转oc：
        NSString *str = [NSString stringWithUTF8String:s];
        NSLog(@"%@", str);
        
        // oc转c：
        NSString *str3 = @"oneal";
        const char *ss = [str3 UTF8String];
        printf("%s\n", ss);
        
        /**
         *  去掉收尾空格：
         */
        NSString *str4 = @"   YaoMing China   ";
        str4 = [str4 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSLog(@"去掉首尾空格后：%@", str4);
    }
    return 0;
}
