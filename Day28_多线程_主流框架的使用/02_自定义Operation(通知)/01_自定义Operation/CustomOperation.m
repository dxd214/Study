//
//  CustomOperation.m
//  01_自定义Operation
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "CustomOperation.h"

@implementation CustomOperation

-(void)start {
    [super start];
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
}

-(void)main {
    NSLog(@"%s - %@", __func__, [NSThread currentThread]);
    @autoreleasepool {
        NSString *imageURL = @"http://g.hiphotos.baidu.com/zhidao/pic/item/9f510fb30f2442a79fbc68ded343ad4bd113021e.jpg";
        NSURL *url = [NSURL URLWithString:imageURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // 通知：
            [[NSNotificationCenter defaultCenter] postNotificationName:CustomOperationKEY object:image];
        }];
    }
}

@end
