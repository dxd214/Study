//
//  ViewController.m
//  08_Autolayout简单动画
//
//  Created by Chiang on 16/2/12.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintY;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.constraintY.constant += 20;
    [UIView animateWithDuration:0.3f animations:^{
#warning view中所有子控件的约束：
        [self.view layoutIfNeeded];
    }];
}

@end
