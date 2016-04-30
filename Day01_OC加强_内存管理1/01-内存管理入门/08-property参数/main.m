//
//  main.m
//  08-property参数
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.age = 18;
        
        Car *car = [Car new];
        car.speed = 150;
        person.car = car;
        
        NSLog(@"car.retainCount = %ld", car.retainCount);
        [car release];
        
        Car *car2 = [Car new];
        car2.speed = 80;
        person.car = car2;
        
        NSLog(@"car2.retainCount = %ld", car2.retainCount);
        
        [car2 release];
        
        [person drive];
        
        [person release];
    }
    return 0;
}
