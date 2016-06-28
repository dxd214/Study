//
//  main.m
//  01_查询语句
//
//  Created by Jiang on 16/6/28.
//  Copyright © 2016年 Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        for (int i = 0; i < 100; i++) {
            NSString *str = [NSString stringWithFormat:@"INSERT INTO t_student (id, name, age, score) VALUES (%d ,\"%@\", 2%d, %.1f);", i, @"YaoMing", i, i + 0.0];
            printf("%s\n", str.UTF8String);
        }
    }
    return 0;
}
