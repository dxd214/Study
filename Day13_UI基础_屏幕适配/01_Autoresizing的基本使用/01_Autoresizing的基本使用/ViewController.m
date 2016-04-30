//
//  ViewController.m
//  01_Autoresizing的基本使用
//
//  Created by Chiang on 16/2/10.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *blackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGRect blueBounds = self.blueView.bounds;
    blueBounds.size.width += 20;
    blueBounds.size.height += 20;
    
    self.blueView.bounds = blueBounds;
    
//    CGRect blackBounds = self.blackView.bounds;
}

@end
