//
//  main.m
//  10-MRC转ARC
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        Car *car = [Car new];
        
        [car setSpeed:150];
        [person setCar:car];
        
        
        [person drive];
        
        Car *car2 = [Car new];
        [car2 setSpeed:80];
        /**
         *  此时_car为car2，所以最后在person的dealloc方法中被release的对象也是car2，因此car1的内存被泄漏了。
         */
        [person setCar:car2];
        
    }
    return 0;
}
