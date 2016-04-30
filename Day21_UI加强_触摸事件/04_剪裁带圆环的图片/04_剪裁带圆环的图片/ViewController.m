//
//  ViewController.m
//  04_剪裁带圆环的图片
//
//  Created by Chiang on 16/3/8.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickToClip:(UIButton *)sender {
    UIImage *image = [UIImage imageNamed:@"me"];
    
    // 开启一个比图片稍大的bitmap：
    CGFloat margin = 5;
    CGSize contextSize = CGSizeMake(image.size.width + 2 * margin, image.size.height + 2 * margin);
    // 开始图形上下文：
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 圆环：
    CGPoint center = CGPointMake(contextSize.width * 0.5, contextSize.height * 0.5);
    CGFloat radius = MIN(image.size.width, image.size.height) * 0.5;
    
    UIBezierPath *loopPath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    // 设置圆环宽度和颜色：
    CGContextSetLineWidth(context, margin);
    [[UIColor blueColor] set];
    
    CGContextAddPath(context, loopPath.CGPath);
    CGContextStrokePath(context);
    
    UIBezierPath *imagePath = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CGContextAddPath(context, imagePath.CGPath);
    // 执行剪裁：
    CGContextClip(context);
    
    // 绘制图片:
    [image drawAtPoint:CGPointMake(margin, margin)];
    image = UIGraphicsGetImageFromCurrentImageContext();
    self.iconImageView.image = image;
    // 结束图形上下文：
    UIGraphicsEndImageContext();
    
    // 保存：
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"image.png"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:filePath atomically:YES];
}

@end
