//
//  main.m
//  02-autoreleasepool的使用场景
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 类方法快速创建对象：
        Person *person = [Person person];
        [person run];
        
        Student *student = [Student person];
        [student run];
        
        // instancetype能判断返回的类型和接收的类型是否一致，如果不一致则警告，而id不行。
//        NSString *str = [Student person];
    }
    return 0;
}
