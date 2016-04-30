//
//  main.m
//  05-block的应用场景2
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^blockType)();

blockType test(int num)
{
    blockType type;
    
    switch (num) {
        case 1:
            type = ^() {
                NSLog(@"111111111111111111.....");
            };
            break;
        case 2:
            type = ^() {
                NSLog(@"222222222222222222.....");
            };
            break;
        case 3:
            type = ^() {
                NSLog(@"333333333333333333.....");
            };
            break;
        default:
            break;
    }
    
    return type;
}

void print()
{
    NSLog(@"-------------------->");
    
    blockType type = test(2);
    type();
    
    NSLog(@"-------------------->");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        print();
    }
    return 0;
}
