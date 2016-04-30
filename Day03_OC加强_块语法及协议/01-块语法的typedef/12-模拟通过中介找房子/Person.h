//
//  Person.h
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "findHouseProtocol.h"

@interface Person : NSObject

@property (nonatomic, strong) id<findHouseProtocol> delegate;

-(void)needHouse;

@end
