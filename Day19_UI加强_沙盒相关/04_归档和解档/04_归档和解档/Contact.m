//
//  Contact.m
//  04_归档和解档
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "Contact.h"

@implementation Contact

#pragma NSCoding

// 归档：
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.tel forKey:@"tel"];
}

// 解档：
-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
