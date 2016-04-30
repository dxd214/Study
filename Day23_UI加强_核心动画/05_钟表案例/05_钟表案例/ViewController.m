//
//  ViewController.m
//  05_钟表案例
//
//  Created by Chiang on 16/3/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *secondView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CALayer *clockLayer = [CALayer layer];
    clockLayer.bounds = CGRectMake(0, 0, 300, 300);
    clockLayer.position = self.view.center;
    [self.view.layer addSublayer:clockLayer];
    
    // 加入图片：
    clockLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    
    // 创建指针：
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3, 105)];
    secondView.center = self.view.center;
    // 修改锚点：
    secondView.layer.anchorPoint = CGPointMake(0.5, 1);
    [self.view addSubview:secondView];
    [secondView setBackgroundColor:[UIColor redColor]];
    self.secondView = secondView;
    
    // 开启定时器：
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(move) userInfo:nil repeats:YES];
//    [timer fire];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(move)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void)move {
    // 获取当前日历：
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获取当前时间：
    NSDate *date = [NSDate date];
    // 获取时间的一部分：
    NSDateComponents *com = [calendar components:NSCalendarUnitSecond fromDate:date];
    // 拿到当前秒：
    NSInteger second = com.second;
    // 计算一秒转动的弧度：
    CGFloat arc = 2 * M_PI / 60;
    arc *= second;
//    self.secondView.transform = CGAffineTransformRotate(self.secondView.transform, arc);
    self.secondView.transform = CGAffineTransformMakeRotation(arc);
}

@end
