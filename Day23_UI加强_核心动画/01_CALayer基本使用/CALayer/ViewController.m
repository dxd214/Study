//
//  ViewController.m
//  CALayer
//
//  Created by Chiang on 16/3/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置边框宽度和颜色：
    self.imageView.layer.borderWidth = 5;
    self.imageView.layer.borderColor = [UIColor redColor].CGColor;
    
    // 设置圆角：
//    self.imageView.layer.cornerRadius = 25;
    // 剪切圆角以外的部分：
//    self.imageView.layer.masksToBounds = YES;
    
    // 为图片框设置阴影：
    self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageView.layer.shadowOffset = CGSizeMake(10, 10);
    self.imageView.layer.shadowOpacity = 1;
}

@end
