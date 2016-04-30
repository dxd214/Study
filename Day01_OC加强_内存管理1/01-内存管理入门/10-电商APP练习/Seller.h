//
//  Seller.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import "Person.h"
#import "Goods.h"

@interface Seller : Person

@property (nonatomic, retain) Goods *goods;

@end
