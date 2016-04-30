//
//  main.m
//  14-autorelease的基本使用
//
//  Created by SteveChiang on 15/12/20.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 autoreleasepool仅仅只是在最后把pool中的所有对象进行一次release，并不是释放对象。也就是说，加入在此之前对象的retainCount为2，那么即使自定释放池执行完成也不会释放此对象。
 */

int main(int argc, const char * argv[]) {
    
    Person *person = [Person new];

    @autoreleasepool {
        
        // 对象调用autorelease方法，将此对象加入到自动释放池中：
        [person autorelease];
        [person run];
    } // 此处释放pool中的对象。。。。
    
    [person run]; // 此处野指针访问.
    
    return 0;
}
