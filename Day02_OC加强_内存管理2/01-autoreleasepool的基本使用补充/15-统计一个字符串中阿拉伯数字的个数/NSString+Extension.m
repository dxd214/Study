//
//  NSString+Extension.m
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+(int)countOfNumbersFromStr:(NSString *)str
{
    int count = 0;
    
    for (int i = 0; i < str.length; i++) {
        unichar ch = [str characterAtIndex:i];
        if (ch >= '0' && ch <= '9') {
            count++;
        }
    }
    return count;
}

-(int)countOfNumbersFromStr
{
    int count = 0;
    
    for (int i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (ch >= '0' && ch <= '9') {
            count++;
        }
    }
    return count;
}

@end
