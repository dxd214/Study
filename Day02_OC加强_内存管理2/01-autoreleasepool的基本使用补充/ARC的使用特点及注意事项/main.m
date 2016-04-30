//
//  main.m
//  ARC的使用特点及注意事项
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  这种写法对象刚创建出来就会被释放，所以没有任何意义。
         */
        __weak Student *student = [Student new];
        
        // 此处不会报错，因为student被释放后相当于student = nil，nil调用get方法语法上是没错的。
        NSLog(@"student.age == %d", student.age);
    }
    return 0;
}
