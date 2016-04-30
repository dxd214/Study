//
//  NavigationController.m
//  04_导航控制器的基本使用
//
//  Created by Chiang on 16/2/16.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setupNavController];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setupNavController];
    }
    return self;
}

-(void)setupNavController {
    
}

@end
