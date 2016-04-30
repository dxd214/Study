//
//  Person.h
//  01-autoreleasepool的基本使用补充
//
//  Created by SteveChiang on 15/12/22.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;

-(void)run;

@end

@interface Person (printNameAndAge)

-(void)printNameAndAge;
-(void)run;

@end
