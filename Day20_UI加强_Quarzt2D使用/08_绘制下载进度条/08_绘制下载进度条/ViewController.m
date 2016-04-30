//
//  ViewController.m
//  08_绘制下载进度条
//
//  Created by Chiang on 16/3/5.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CustomView *customView;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)sliderToProgress:(UISlider *)sender {
    NSLog(@"%f", sender.value);
    
    self.customView.progress = sender.value;
}

@end
