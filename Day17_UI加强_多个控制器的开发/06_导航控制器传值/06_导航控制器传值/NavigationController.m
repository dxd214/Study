//
//  NavigationController.m
//  06_导航控制器传值
//
//  Created by Chiang on 16/2/17.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(instancetype)init
{
    if (self = [super init]) {
        [self.view setBackgroundColor:[UIColor orangeColor]];
    }
    return self;
}

@end
