//
//  Goods.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义时间结构体：
typedef struct {
    int hour;
    int min;
    int sec;
} MyTime;

// 定义日期结构体：
typedef struct {
    int year;
    int month;
    int day;
    
    MyTime time;
} MyDate;

@interface Goods : NSObject

@property (nonatomic, retain) NSString *productName;
@property (nonatomic, assign) float productPrice;
@property (nonatomic, assign) float productWeight;
@property (nonatomic, retain) NSString *productImage;
@property (nonatomic, assign) MyDate productDate;
@property (nonatomic, assign) MyDate expireDate;

@end
