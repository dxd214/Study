//
//  main.m
//  03-block的应用场景1
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void print(void (^printBlock)())
{
    NSLog(@"---------------------->");
    
    printBlock();
    
    NSLog(@"---------------------->");
}

void number(int num)
{
    typedef void (^printBlock)();
    printBlock p;
    
    switch (num) {
        case 1:
            p = ^() {
                NSLog(@"11111111111111....");
            };
            break;
        case 2:
            p = ^() {
                NSLog(@"22222222222222....");
            };
            break;
        case 3:
            p = ^() {
                NSLog(@"33333333333333....");
            };
            break;
        default:
            break;
    }
    
    print(p);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        number(1);
        number(2);
        number(3);
    }
    return 0;
}
