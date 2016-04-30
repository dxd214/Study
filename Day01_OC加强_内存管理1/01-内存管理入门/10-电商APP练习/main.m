//
//  main.m
//  10-电商APP练习
//
//  Created by SteveChiang on 15/12/19.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Seller.h"
#import "Buyer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        Buyer *buyer = [[Buyer alloc] init];
        Goods *goods = [Goods new];
        Seller *seller = [Seller new];
        seller.goods = goods;
        
        [buyer release];
        [person release];
        [goods release];
        [seller release];
    }
    return 0;
}
