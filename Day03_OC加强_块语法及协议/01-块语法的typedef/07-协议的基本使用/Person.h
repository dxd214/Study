//
//  Person.h
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/24.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProtocol.h"
#import "WorkProtocol.h"

@interface Person : NSObject <BaseProtocol, WorkProtocol>

@end
