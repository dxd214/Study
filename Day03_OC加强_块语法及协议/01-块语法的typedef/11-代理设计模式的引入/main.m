//
//  main.m
//  11-代理设计模式的引入
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby.h"
#import "Nanny.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Nanny *nanny = [Nanny new];
        Baby *baby = [Baby new];
        
        baby.nanny = nanny;
        [baby wantToEat];
        [baby wantToSleep];
    }
    return 0;
}
