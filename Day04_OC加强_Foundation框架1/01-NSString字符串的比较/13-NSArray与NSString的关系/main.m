//
//  main.m
//  13-NSArray与NSString的关系
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = @[@1, @2, @3, @4];
        
        /**
         *  把字符串中的元素以"-"连接起来：
         */
        NSString *str = [array componentsJoinedByString:@"-"];
        NSLog(@"%@", str);
        
        str = [array componentsJoinedByString:@" "];
        NSLog(@"%@", str);
        
        /**
         *  把一个字符串分割成数组：
         */
        NSString *str2 = @"4006-272-273";
        NSArray *array2 = [str2 componentsSeparatedByString:@"-"];
        NSLog(@"%@", array2);
        NSLog(@"%@", [array2 lastObject]);
        
        NSString *str3 = @"4006-272-273#400-453-580";
        NSArray *array3 = [str3 componentsSeparatedByString:@"#"];
        NSLog(@"%@", array3);
        
        NSArray *first = [[array3 firstObject] componentsSeparatedByString:@"-"];
        NSArray *second = [[array3 lastObject] componentsSeparatedByString:@"-"];
        
        NSLog(@"%@", first);
        NSLog(@"%@", second);
    }
    return 0;
}
