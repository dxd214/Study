//
//  main.m
//  09-@property参数－补充
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [Dog new];
        dog.legs = 4;
        
        Person *person = [[Person alloc] init];
        [person isVip:YES];
        NSLog(@"是否会员：%d", person.isVip);
        
    }
    return 0;
}
