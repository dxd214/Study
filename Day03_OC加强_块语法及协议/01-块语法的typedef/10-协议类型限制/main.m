//
//  main.m
//  10-协议类型限制
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GirlFriend.h"
#import "Dog.h"
#import "houseHold.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [Dog new];
        GirlFriend *girl = [GirlFriend new];
//        id<houseHold> coder = dog;
        id<houseHold> coder = girl;
        
        // 表示赋值对象必须是Girl对象，且必须遵守houseHold协议：
        GirlFriend<houseHold> *obj = girl;
    }
    return 0;
}
