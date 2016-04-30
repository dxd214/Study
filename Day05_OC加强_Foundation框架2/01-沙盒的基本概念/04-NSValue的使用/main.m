//
//  main.m
//  04-NSValue的使用
//
//  Created by SteveChiang on 15/12/31.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void test()
{
    CGPoint p = CGPointMake(10, 10);
    NSValue *v = [NSValue valueWithPoint:p];
    NSLog(@"%@", v);
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:v];
    
    CGSize s = CGSizeMake(30, 10);
    [array addObject:[NSValue valueWithSize:s]];
    
    NSValue *v2 = [array lastObject];
    CGSize s2 = [v2 sizeValue];
    NSLog(@"%@", NSStringFromSize(s2));
}

typedef struct D {
    int year;
    int month;
    int day;
} MyDate;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyDate md = {1994, 5, 17};
        NSMutableArray *array = [NSMutableArray array];
        NSValue *v = [NSValue valueWithBytes:&md objCType:@encode(MyDate)];
        [array addObject:v];
        
        MyDate md2;
        [v getValue:&md2];
        NSLog(@"%d--%d--%d", md2.year, md2.month, md2.day);
    }
    return 0;
}
