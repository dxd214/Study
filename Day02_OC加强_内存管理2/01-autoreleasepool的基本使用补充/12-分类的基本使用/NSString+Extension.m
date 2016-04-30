//
//  NSString+Extension.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/21.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+(void)printLine
{
    NSLog(@"-----------------");
}

+(void)printSumWithNum:(int)num1 andNum2:(int)num2
{
    NSLog(@"%d", num1 +num2);
}

@end
