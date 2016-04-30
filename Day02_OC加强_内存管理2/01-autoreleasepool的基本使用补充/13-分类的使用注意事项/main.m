//
//  main.m
//  13-分类的使用注意事项
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/**
 分类中只能声明方法，不能声明实例变量。即使用@property也无法生成下划线的实例变量；
 分类中可以访问类中的实例变量；
 如果在分类中出现了和原类中同名的方法，优先访问分类中的方法；
 如果在多个分类中都出现了同名的方法，那么执行最后编译的那个分类的方法。
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        person.name = @"YaoMing";
        person.age = 18;
        [person printNameAndAge];
        
        [person run];
    }
    return 0;
}
