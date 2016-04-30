//
//  main.m
//  05-NSDate的使用
//
//  Created by SteveChiang on 15/12/31.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

void test()
{
    /**
     *  获取当前时间：
     */
    NSDate *date = [NSDate date];
    // 打印出的时间是格林威治时间：
    NSLog(@"%@", date);
    
    /**
     *  格式化时间：
     */
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置日期显示格式：
    formatter.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    // 格式化日期：
    NSString *time = [formatter stringFromDate:date];
    NSLog(@"%@", time);
}

void test2()
{
    /**
     *   计算明天的此刻：
     */
    NSTimeInterval ti = 60 * 60 *24;
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:ti];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSString *time = [formatter stringFromDate:date];
    NSLog(@"%@", time);
    
    /**
     *  计算昨天的此刻：
     */
    NSDate *d = [date addTimeInterval:-ti];
    NSString *t = [formatter stringFromDate:d];
    NSLog(@"%@", t);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date = [NSDate date];
        NSCalendar *ca = [NSCalendar currentCalendar];
        NSDateComponents *com = [ca components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
        
        NSLog(@"year:%ld--month:%ld--day:%ld", com.year, com.month, com.day);
    }
    return 0;
}
