//
//  main.m
//  15-NSDictionary的基本使用
//
//  Created by SteveChiang on 15/12/28.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  创建空字典：
         */
        NSDictionary *dict = [NSDictionary dictionary];
        /**
         *  创建有一组键值对的字典：
         */
        NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"YaoMing" forKey:@"C"];
        /**
         *  创建多组键值对：
         */
        NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"vaule2", @"key2", nil];
        
        NSLog(@"%@", dict3);
        
        /**
         *  快速创建字典：
         */
        NSDictionary *dict4 = @{@"C":@"YaoMing", @"PF":@"YiJianLian", @"SF":@"James", @"SG":@"Harden", @"PG":@"Curry"};
        NSLog(@"%@", dict4);
        
        /**
         *  获取字典的长度：
         */
        NSLog(@"dict4的长度为：%ld", dict4.count);
        
        /**
         *  根据key取出value：
         */
        NSString *value = [dict4 objectForKey:@"C"];
        NSLog(@"%@", value);
        
        /**
         *  字典的遍历：
         */
        for (NSString *key in dict4) {
            NSLog(@"key = %@, value = %@", key, [dict4 objectForKey:key]);
        }
        
        NSLog(@"------------------------------------------>");
        
        /**
         *  block遍历字典：
         */
        [dict4 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key = %@, value = %@", key, value);
        }];
        
        /**
         *  字典的key值和value值都必须是对象；
         *  键值不能重复，但如果重复了也不会报错；
         *  如果重复了，那么重复的那个将不能被保存。
         */
    }
    return 0;
}
