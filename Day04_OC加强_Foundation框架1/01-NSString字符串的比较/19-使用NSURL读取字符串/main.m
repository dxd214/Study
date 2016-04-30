//
//  main.m
//  19-使用NSURL读取字符串
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"xxxxxxxx";
        NSURL *url = [NSURL URLWithString:@"https://www.icbc.com"];
    
        if ([str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil]) {
            NSLog(@"成功...");
        } else {
            NSLog(@"失败...");
        }
    }
    return 0;
}
