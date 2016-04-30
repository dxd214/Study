//
//  ViewController.m
//  11_Mansory实现兄弟view间的约束
//
//  Created by Chiang on 16/2/12.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

#define MAS_SHORTHAND

#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *blueView = [[UIView alloc] init];
    [self.view addSubview:blueView];
    [blueView setBackgroundColor:[UIColor blueColor]];
    
    UIView *redView = [[UIView alloc] init];
    [self.view addSubview:redView];
    [redView setBackgroundColor:[UIColor redColor]];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(40);
        make.left.offset(20);
        make.right.offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(blueView.bottom).offset(20);
        make.right.equalTo(blueView).offset(0);
        make.height.equalTo(blueView);
        make.width.equalTo(blueView).multipliedBy(0.5);
    }];
}

@end
