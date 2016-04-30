//
//  main.m
//  02-内存管理的原则
//
//  Created by SteveChiang on 15/12/17.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  1、基本数据类型不需要内存管理；
         *  2、谁创建，谁release；
         */
        
        /**
         *  1、野指针：1)定义的指针变量没有初始化 2)指向的空间已被释放。
         *  2、内存泄漏：如果栈区的对象已经被释放了，而堆区的空间还没背释放，那么堆区的内存空间就被泄露了。
         */
        
        Dog *dog = [Dog new];
//        [dog release];
        
        Dog *dog2 = [dog retain];
        NSLog(@"dog:%ld,dog2:%ld", dog.retainCount, dog2.retainCount);
        
        [dog release];
        [dog release];
    }
    return 0;
}
