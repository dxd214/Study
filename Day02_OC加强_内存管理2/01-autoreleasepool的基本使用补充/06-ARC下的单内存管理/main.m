//
//  main.m
//  06-ARC下的单内存管理
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 指针默认都是强指针：
        Car *car = [Car new];
        // 加上__weak后，表示弱指针，所以会立即释放。
        __weak Car *car2 = car;
        
        car2 = car;
        // 此时对于car这个对象来说已经没有强指针指向了，所以会立即释放。
        car = nil; // 没有强指针指向的话，会在这一行释放。
        
        [car run];
        
        NSLog(@"xxxxxxx");
    }
    return 0;
}
