//
//  Contact.h
//  04_归档和解档
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *tel;

@end
