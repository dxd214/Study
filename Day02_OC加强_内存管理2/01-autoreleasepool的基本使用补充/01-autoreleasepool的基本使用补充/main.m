//
//  main.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/20.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        [person retain];
        // 必须加入自动释放池在能被延迟释放：
        [person autorelease];
        
        // 自动释放池的嵌套：
        /**
         自动释放池的栈和内存的栈区不一样，自动释放池的栈是一种数据结构。
         自动释放池中不适合放内存占用很大的对象。因为内存占用大的对象应该直接用release立即释放才对。
         */
        @autoreleasepool {
            [person autorelease];
            // 不要多次加入自动释放池：
//            [person autorelease];
//            [person autorelease];
        }
    } // <---- 对象在此处销毁。
    return 0;
}
