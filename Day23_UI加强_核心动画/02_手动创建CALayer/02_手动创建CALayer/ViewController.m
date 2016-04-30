//
//  ViewController.m
//  02_手动创建CALayer
//
//  Created by Chiang on 16/3/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *redLayer = [CALayer layer];
    
    [redLayer setBackgroundColor:[UIColor redColor].CGColor];
    
    redLayer.position = CGPointMake(100, 100);
    redLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    [self.view.layer addSublayer:redLayer];
    
    // 设置圆角：
    redLayer.cornerRadius = 25;
    redLayer.masksToBounds = YES;
    
    // 设置透明度：
    redLayer.opacity = 0.5f;
    
    // 设置内容：
    redLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"img01"].CGImage);
    
    // 边框：
    redLayer.borderWidth = 5;
    redLayer.borderColor = [UIColor blackColor].CGColor;
}

@end
