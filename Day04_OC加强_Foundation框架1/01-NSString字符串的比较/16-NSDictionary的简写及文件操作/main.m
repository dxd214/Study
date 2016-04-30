//
//  main.m
//  16-NSDictionary的简写及文件操作
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{@"zbz":@"ZhangBoZhi", @"cgx":@"ChenGuanXi", @"xtf":@"XieTingFeng"};
        NSLog(@"%@", dict[@"zbz"]);
        
        /**
         *  保存字典到文件：
         */
        BOOL isWrite = [dict writeToFile:@"写入路径" atomically:YES];
        
        /**
         *  读取：
         */
        [NSDictionary dictionaryWithContentsOfFile:@"读取路径"];
        
//        
//        NSArray *chengdu = [NSArray arrayWithObjects:@"chengdu", @"qing", nil];
//        NSArray *guangdong = [NSArray arrayWithObjects:@"guangdong", @"yin", nil];
//        
//        NSDictionary *weather =
    }
    return 0;
}
