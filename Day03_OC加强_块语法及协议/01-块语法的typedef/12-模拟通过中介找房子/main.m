//
//  main.m
//  12-模拟通过中介找房子
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Intermediary.h"
#import "Person.h"
#import "LianJia.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Intermediary *inter = [Intermediary new];
        Person *person = [Person new];
        LianJia *lianjia = [LianJia new];
        
        person.delegate = inter;
        person.delegate = lianjia;
        [person needHouse];
    }
    
    // 代理类：Intermediary;
    // 代理对象：delegate;
    // 协议：findHouseProtocol;
    // 协议内容：findHouse;
    
    return 0;
}
