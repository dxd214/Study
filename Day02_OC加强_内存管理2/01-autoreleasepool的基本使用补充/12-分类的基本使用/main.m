//
//  main.m
//  12-分类的基本使用
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Extension.h"
#import "Person.h"
#import "Person+playGame.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [NSString printSumWithNum:5 andNum2:8];
        [NSString printLine];
        
        Person *person = [Person new];
        [person run];
        [person eat];
        [person playGame];
    }
    return 0;
}
