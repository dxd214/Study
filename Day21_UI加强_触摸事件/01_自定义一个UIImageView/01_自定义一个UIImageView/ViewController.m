//
//  ViewController.m
//  01_自定义一个UIImageView
//
//  Created by Chiang on 16/3/6.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (nonatomic, weak) CustomView *cu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header"]];
//    imageView.center = self.view.center;
//    [self.view addSubview:imageView];
//
//    self.imageView = imageView;
    
    CustomView *cu = [[CustomView alloc] init];
    [self.view addSubview:cu];
    cu.frame = CGRectMake(0, 0, 100, 100);
    cu.center = self.view.center;
    
    cu.image = [UIImage imageNamed:@"me"];
    self.cu = cu;
}

- (IBAction)changeImage:(UIButton *)sender {
    self.cu.image = [UIImage imageNamed:@"hero_fly_1"];
}

@end
