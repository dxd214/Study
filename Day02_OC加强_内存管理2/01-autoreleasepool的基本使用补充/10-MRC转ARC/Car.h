//
//  Car.h
//  01-内存管理入门
//
//  Created by SteveChiang on 15/12/18.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    int _speed;
}

-(void)setSpeed:(int)speed;
-(void)run;

@end
