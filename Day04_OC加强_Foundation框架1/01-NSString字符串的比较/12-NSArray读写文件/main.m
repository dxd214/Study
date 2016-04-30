//
//  main.m
//  12-NSArray读写文件
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@"one", @"two", @1, @2];
        
        // 写入文件：
        BOOL result = [array writeToFile:@"此处填写文件路径" atomically:YES];
        if (result) {
            NSLog(@"写入成功....");
        } else {
            NSLog(@"写入失败....");
        }
        
        // 写入文件：
        NSArray *readArr = [NSArray arrayWithContentsOfFile:@"此处填写文件路径"];
        NSLog(@"%@", readArr);
    }
    return 0;
}
