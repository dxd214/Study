//
//  ContactModel.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ContactModel.h"

@implementation ContactModel

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.contactName forKey:@"name"];
    [aCoder encodeObject:self.contactTel forKey:@"tel"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.contactName = [aDecoder decodeObjectForKey:@"name"];
        self.contactTel = [aDecoder decodeObjectForKey:@"tel"];
    }
    return self;
}

@end
