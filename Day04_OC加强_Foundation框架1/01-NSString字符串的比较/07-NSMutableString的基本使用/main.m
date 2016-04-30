//
//  main.m
//  07-NSMutableString的基本使用
//
//  Created by SteveChiang on 15/12/26.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  不可变：字符串占用的空间和内容都不能改变。
         */
        NSString *str = @"YaoMing";
        NSLog(@"%p", str);
        str = @"Rose";
        NSLog(@"%p", str);
        
        NSMutableString *mStr = [NSMutableString stringWithFormat:@"YaoMing"];
        NSLog(@"%p", mStr);
        [mStr appendString:@" Fuck Kobe"];
        NSLog(@"%p", mStr);
    }
    return 0;
}
