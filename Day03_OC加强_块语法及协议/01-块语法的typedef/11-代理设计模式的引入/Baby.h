//
//  Baby.h
//  01-块语法的typedef
//
//  Created by SteveChiang on 15/12/25.
//  Copyright © 2015年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lookafterBaby.h"

@class Nanny;

@interface Baby : NSObject

@property (nonatomic, strong) Nanny<lookafterBaby> *nanny;
@property (nonatomic, assign) int blood;

-(void)wantToEat;
-(void)wantToSleep;

@end
