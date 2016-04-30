//
//  main.m
//  14-非正式协议
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "NSObject+Eat.h"

/**
 NSObject或者其子类的类别就是非正式协议。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [Person eat];
        Person *person = [Person new];
        [person run];
    }
    return 0;
}
