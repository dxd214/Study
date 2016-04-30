//
//  main.m
//  17-NSMutableDictionary的基本使用
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  空字典：
         */
        NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
        
        /**
         *  添加键值对：
         */
        [mDict setValue:@"YaoMing" forKey:@"C"];
        [mDict setValue:@"YiJianLian" forKey:@"PF"];
        NSLog(@"%@", mDict);
        
        /**
         *  删除键值对：
         */
//        [mDict removeObjectForKey:@"C"];
//        NSLog(@"%@", mDict);
//        // 全部删除：
//        [mDict removeAllObjects];
        
        /**
         *  修改：
         */
        [mDict setObject:@"O'Neal" forKey:@"C"];
        NSLog(@"%@", mDict);
        
        /**
         *  查找：
         */
        NSArray *array = [mDict allKeys];
        BOOL result = [array containsObject:@"PF"];
        
        if (result) {
            NSLog(@"存在....");
        } else {
            NSLog(@"不存在....");
        }
    }
    return 0;
}
