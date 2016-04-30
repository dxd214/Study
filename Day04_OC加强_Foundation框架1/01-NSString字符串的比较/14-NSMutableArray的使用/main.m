//
//  main.m
//  14-NSMutableArray的使用
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *mArray = [NSMutableArray array];
        NSLog(@"%@", mArray);
        NSLog(@"%p", mArray);
        
        [mArray addObject:@"YaoMing"];
        NSLog(@"%@", mArray);
        NSLog(@"%p", mArray);
        
        /**
         *  插入元素：
         */
        [mArray insertObject:@"James" atIndex:0];
        NSLog(@"%@", mArray);
        
        /**
         *  删除元素：
         */
        [mArray removeObjectAtIndex:1];
        NSLog(@"%@", mArray);
        // 删除全部：
        [mArray removeAllObjects];
        NSLog(@"%@", mArray);
        
        /**
         *  修改元素：
         */
        NSMutableArray *mArray2 = [NSMutableArray arrayWithObjects:@"one", @"two", @3, nil];
        [mArray2 replaceObjectAtIndex:1 withObject:@2];
        NSLog(@"%@", mArray2);
        
        /**
         *  查找元素：
         */
        BOOL result = [mArray2 containsObject:@"one"];
        if (result) {
            NSLog(@"存在...");
        } else {
            NSLog(@"不存在...");
        }
        
        /**
         *  交换元素：
         */
        NSMutableArray *mArray3 = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
        [mArray3 exchangeObjectAtIndex:0 withObjectAtIndex:4];
        NSLog(@"%@", mArray3);
    }
    return 0;
}
