//
//  main.m
//  02-常见结构体
//
//  Created by SteveChiang on 15/12/31.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CGPoint c1;
        c1.x = 20;
        c1.y = 40;
        
        CGPoint c2 = {10, 10};
        CGPoint c3 = {.x = 10};
        
        NSPoint n1;
        n1.x = 30;
        n1.y = 10;
        
        /**
         *  OC中特有的赋值方式：
         */
        CGPoint c4 = CGPointMake(10, 20);
        NSPoint n2 = NSMakePoint(30, 100);
        
        CGSize s1;
        s1.height = 8;
        s1.width = 10;
        
        // OC写法：
        CGSize s2 = CGSizeMake(10, 20);
        NSSize ns = NSMakeSize(10, 20);
        
        CGRect r1;
        r1.origin.x = 10;
        r1.origin.y = 20;
        r1.size.width = 20;
        r1.size.height = 10;
        
        CGRect r2 = {{10, 10}, {10, 10}};
        
        // OC写法：
        CGRect r3 = CGRectMake(10, 10, 10, 10);
        NSRect nr = NSMakeRect(10, 10, 10, 10);
        NSLog(@"nr = %@", NSStringFromRect(nr));
    }
    return 0;
}
