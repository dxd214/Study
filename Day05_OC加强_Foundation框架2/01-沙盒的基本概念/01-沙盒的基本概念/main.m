//
//  main.m
//  01-沙盒的基本概念
//
//  Created by SteveChiang on 15/12/31.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  获取沙盒路径：
         */
        NSString *sandboxPath = NSHomeDirectory();
        NSLog(@"%@", sandboxPath);
        
        /**
         *  document目录：
         */
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"%@", docPath);
        
        /**
         *  cache目录：
         */
        
    }
    return 0;
}
