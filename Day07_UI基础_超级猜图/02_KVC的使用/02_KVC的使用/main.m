//
//  main.m
//  02_KVC的使用
//
//  Created by SteveChiang on 16/2/3.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [[Person alloc] init];
//        person1.name = @"YaoMing";
//        person1.age = 35;
        
        // kvc的方式：
        [person1 setValue:@"YaoMing" forKey:@"name"];
        [person1 setValue:@"35" forKey:@"age"];
        NSLog(@"person1.name = %@ person1.age = %ld", person1.name, person1.age);
    }
    return 0;
}
