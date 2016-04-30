//
//  ViewController.m
//  02_Autoresizing代码实现
//
//  Created by Chiang on 16/2/10.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *redView;
@property (nonatomic, weak) UIView *blueView;

@end

@implementation ViewController

#warning Autoresizing只能设置子控件与父控件间的约束，但无法设置子控件和子控件之间的约束。

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:redView];
    [redView setBackgroundColor:[UIColor redColor]];
    self.redView = redView;
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(25, 25, 50, 50)];
    [redView addSubview:blueView];
    [blueView setBackgroundColor:[UIColor blueColor]];
    self.blueView = blueView;
    
    // 设置blueView的属性：
    blueView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect redBounds = self.redView.bounds;
    redBounds.size.width += 20;
    redBounds.size.height += 20;
    self.redView.bounds = redBounds;
}

@end
