//
//  main.m
//  03-NSnumber的使用
//
//  Created by SteveChiang on 15/12/31.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  把基本数据类型包装成引用数据类型：
         */
        int num = 10;
        float num2 = 3.14f;
        double num3 = 3.141592;
        
        NSNumber *objNum = [NSNumber numberWithInt:num];
        NSLog(@"%@", objNum);
        
        NSMutableArray *array = [NSMutableArray arrayWithObjects:objNum, nil];
        NSLog(@"%@", array.firstObject);
        
        NSNumber *objNum2 = [NSNumber numberWithFloat:num2];
        [array addObject:objNum2];
        NSLog(@"%@", objNum2);
        
        NSNumber *objNum3 = [NSNumber numberWithDouble:num3];
        [array addObject:objNum3];
        NSLog(@"%@", objNum3);
        
        [array addObject:@18];
        
        NSLog(@"%@", array);
        
        NSNumber *n1 = array[0];
        int a = n1.intValue;
        double b = [array[2] doubleValue];
        float c = [array[1] floatValue];
        NSLog(@"%.2f", a + b + c);
    }
    return 0;
}
