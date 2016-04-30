//
//  main.m
//  02-NSString字符串比较补充
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str1 = @"abc";
        NSString *str2 = @"abc";
        NSString *str3 = [NSString stringWithFormat:@"abc"];
        NSString *str4 = [NSString stringWithFormat:@"ABC"];
        
        /**
         *  "=="仅仅只是判断地址，而不是判断值。
         */
        if (str1 == str3) {
            NSLog(@"==");
        } else {
            NSLog(@"!=");
        }
        
        /**
         *  区分大小写
         */
        if ([str1 isEqualToString:str4]) {
            NSLog(@"==");
        } else {
            NSLog(@"!=");
        }
    }
    return 0;
}
