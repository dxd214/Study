//
//  Person.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject
{
    Car *_car;
}

-(void)setCar:(Car *)car;
-(void)drive;

@end
