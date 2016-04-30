//
//  main.m
//  08-ARC下的循环引用问题
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  person和dog都是局部变量，局部变量的生命周期是从对象创建开始，到对象所在的代码块结束为止。
         */
        Person *person = [Person new];
        Dog *dog = [Dog new];
        
        // 此处构成循环引用，互相的强指针指向：
        person.dog = dog;
        dog.person = person;
        
        /**
         *  代码块里的代码执行结束后，栈区空间被释放，但堆区由于两个强指针互相指向对方，所以不会被释放。
         */
        
        /**
         *  解决办法，将其中一个对象设为weak，这样其中一个对象释放后，另一个也会跟着释放。
         */
        
        NSLog(@"xxxxxxxxxxx");
        
    }
    return 0;
}
