//
//  main.m
//  03-单个对象的内存管理问题(野指针)
//
//  Created by SteveChiang on 15/12/17.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [Dog new];
        [dog eat];
        
        [dog release];
        /**
         *  已经release的对象不能再被访问：
         */
        [dog retain];
        NSLog(@"dog.retainCount == %ld", dog.retainCount);
    }
    return 0;
}
