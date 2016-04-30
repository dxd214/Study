//
//  ViewController.m
//  05_添加水印图片
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

- (IBAction)clickToWatermark:(UIButton *)sender {
    UIImage *image = [UIImage imageNamed:@"header"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    NSString *text = @"YaoMing";
    [text drawInRect:CGRectMake(200, 200, 300, 300) withAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor], NSFontAttributeName:[UIFont systemFontOfSize:20.0f]}];
    
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

@end
