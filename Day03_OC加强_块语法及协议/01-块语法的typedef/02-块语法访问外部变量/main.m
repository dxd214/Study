//
//  main.m
//  02-块语法访问外部变量
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int y = 0;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"13- y = %d", y);
        NSLog(@"14- y = %p", &y);
        
        int m = 10;
        NSLog(@"1- m = %d", m);
        NSLog(@"2- &m = %p", &m); // 栈区。
        
        __block int x = 10;
        NSLog(@"7- x = %d", x);
        NSLog(@"8- x = %p", &x);

        // 定义一个block：
        // block内部可以访问外部变量：
        void (^myBlock1)() = ^() {
            /**
             当block访问外部变量时，会把外部变量的值复制一份存到内存中。
             */
            /**
             在block内部不能修改外部变量的值，因为是以const的方式拷贝过来的。
             */
            NSLog(@"3- m = %d", m);
            NSLog(@"5- &m = %p", &m); // 此地址跟2、4不一样，在堆区。
            
            /**
             在block内部定义的变量会存入栈区。
             */
            int n = 50; // 栈区。
            NSLog(@"6- &n = %p", &n);
            
            x = 20;
            NSLog(@"9- x = %d", x);
            NSLog(@"10- x = %p", &x);
            
            /**
             *  全局变量在block内部可以直接修改值：
             */
            y = 1;
            NSLog(@"15- y = %d", y);
            NSLog(@"16- y = %p", &y);
        };
        
        NSLog(@"4- &m = %p", &m);
        myBlock1();
        
        /**
         *  加入__block修饰的变量会一直存在堆内存中：
         */
        NSLog(@"11- x = %d", x);
        NSLog(@"12- x = %p", &x);
    }
    return 0;
}
