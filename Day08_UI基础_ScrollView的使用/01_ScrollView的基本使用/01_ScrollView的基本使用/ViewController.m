//
//  ViewController.m
//  01_ScrollView的基本使用
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置滚动的范围：
    self.scrollView.contentSize = CGSizeMake(1024, 768);
    [self.scrollView setBackgroundColor:[UIColor orangeColor]];
    
    // 去掉横竖两条滚动条：
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    // 弹簧效果：
//    self.scrollView.bounces = NO;
    
    // 不设置contentSize时，依然开启滑动弹簧效果：
    // 前提是bounces为YES。
//    self.scrollView.alwaysBounceHorizontal = YES;
//    self.scrollView.alwaysBounceVertical = YES;
    
    // 设置内边距：
    // 拖动后会停留在设置的内边距的位置：
    self.scrollView.contentInset = UIEdgeInsetsMake(30, 30, 30, 30);
    
    // 设置偏移量：
    self.scrollView.contentOffset = CGPointMake(100, 100);
    
    // 关闭用户交互：
//    self.scrollView.userInteractionEnabled = NO;
}

@end
