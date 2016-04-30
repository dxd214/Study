//
//  main.m
//  15-统计一个字符串中阿拉伯数字的个数
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"wbngf45mhe1gmdge3obq998";
        int count = [NSString countOfNumbersFromStr:str];
        NSLog(@"str中有%d个数字(类方法)", count);
        
        int count2 = [str countOfNumbersFromStr];
        NSLog(@"str中有%d个数字(对象方法)", count2);
    }
    return 0;
}
