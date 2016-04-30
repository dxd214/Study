//
//  main.m
//  18-NSString的基本使用
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"ZhangBoLun";
        // 写入文件：
        NSError *error;
        [str writeToFile:@"路径" atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
        if (error != nil) {
            NSLog(@"写入失败...");
        } else {
            NSLog(@"写入成功...");
        }
        
        // 读取文件：
        NSString *str2 = [NSString stringWithContentsOfFile:@"路径" encoding:NSUTF8StringEncoding error:&error];
        
        if (error != nil) {
            NSLog(@"读取失败...");
        } else {
            NSLog(@"读取成功...");
            NSLog(@"%@", str);
        }
    }
    return 0;
}
