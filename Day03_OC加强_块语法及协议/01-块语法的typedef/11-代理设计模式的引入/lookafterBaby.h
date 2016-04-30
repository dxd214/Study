//
//  lookafterBaby.h
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Baby;

@protocol lookafterBaby <NSObject>

-(void)feedBaby:(Baby *)baby;
-(void)makeSleep:(Baby *)baby;

@end
