//
//  main.m
//  07-copy与内存管理
//
//  Created by SteveChiang on 16/1/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = [NSString stringWithFormat:@"abc"];
        NSLog(@"str.retainCount = %ld", str.retainCount);
    }
    return 0;
}
