//
//  houseHold.h
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol houseHold <NSObject>

@required
-(void)cook;
-(void)wash;

@optional
-(void)job;

@end
