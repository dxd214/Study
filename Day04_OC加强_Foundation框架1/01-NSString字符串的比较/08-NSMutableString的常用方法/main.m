//
//  main.m
//  08-NSMutableString的常用方法
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void test()
{
    NSMutableString *str = [NSMutableString string];
    [str appendFormat:@"http://www.baidu.com/%@", @"image"];
    NSLog(@"%@", str);
    
    // 删除字符串的一部分内容：
    [str deleteCharactersInRange:NSMakeRange(0, 7)];
    NSLog(@"%@", str);
    
    // 插入字符串：
    [str insertString:@"http://" atIndex:0];
    NSLog(@"%@", str);
    
    // 替换字符串的一部分内容：
    [str replaceCharactersInRange:NSMakeRange(11, 5) withString:@"google"];
    NSLog(@"%@", str);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [NSMutableString stringWithFormat:@"abc"];
        // 此时字符串为空：
        str.string = @"";
        NSLog(@"%@", str);
        
        str.string = @"xxxxx";
        NSLog(@"%@", str);
    }
    return 0;
}
