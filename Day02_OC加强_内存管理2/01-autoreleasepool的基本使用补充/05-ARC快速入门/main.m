//
//  main.m
//  05-ARC快速入门
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

/**
 判断是否是ARC机制：
 1、查看项目信息；
 2、不能使用retain、retainCount、release....
 3、dealloc方法中不能使用[super dealloc];
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [[Dog alloc] init];
        [dog run];
    }
    return 0;
}
