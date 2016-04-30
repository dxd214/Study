//
//  ViewController.m
//  06_屏幕截图
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickToCutOffTheDisplay:(UIButton *)sender {
    // 图形上下文：
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.view.layer renderInContext:context];
    
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(getImage, nil, nil, nil);
}

@end
