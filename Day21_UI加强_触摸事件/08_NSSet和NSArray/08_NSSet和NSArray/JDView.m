//
//  JDView.m
//  08_NSSet和NSArray
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "JDView.h"

@implementation JDView

/**
 NSSet存储的东西是无序的，且不可是重复的；
 通过.anyObject来访问；
 用forin来遍历；
 优点：效率高。
 */

/**
 NSArray是有序可重复的；
 通过下标来访问；
 优点：有序。
 */


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSSet *sets = [NSSet setWithObjects:@"hello", @"hi", @"Yao", @99, nil];
    
    // 元素如果重复，则自动忽略：
    NSSet *setss = [NSSet setWithObjects:@"hello", @"hi", @"hi", @"Yao", @99, nil];
    
    NSLog(@"%ld -- %ld", sets.count, setss.count);
    NSLog(@"%@", sets.anyObject);
    
    // 遍历：
    for (NSObject *obj in setss) {
        NSLog(@"%@", obj);
    }
}

@end
