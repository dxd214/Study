//
//  ViewController.m
//  09_代码实现Autolayout约束
//
//  Created by Chiang on 16/2/12.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

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
    
#warning 因为autolayout和autoresizing是互斥的，所以必须禁用autoresizing。
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 添加blueView的约束：
    /**
     constraintWithItem:blueView：被约束的view；
     attribute：被约束的属性；
     toItem：参照的view；
     */
    NSLayoutConstraint *blueTop = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    // 将约束添加到控制器的view上:
    [self.view addConstraint:blueTop];
    
    NSLayoutConstraint *blueLeft = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    [self.view addConstraint:blueLeft];
    
    NSLayoutConstraint *blueRight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
    [self.view addConstraint:blueRight];
    
    NSLayoutConstraint *blueHeight = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
//    [self.view addConstraint:blueHigh];
    [blueView addConstraint:blueHeight];
    
    // redView的约束：
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    [self.view addConstraint:redTop];

    NSLayoutConstraint *redRight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    [self.view addConstraint:redRight];

    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.view addConstraint:redHeight];
    
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:redWidth];
}

@end
