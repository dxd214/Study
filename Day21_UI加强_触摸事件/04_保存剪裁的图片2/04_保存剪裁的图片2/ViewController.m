//
//  ViewController.m
//  04_保存剪裁的图片2
//
//  Created by Chiang on 16/3/7.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

#define ImageWidth image.size.width
#define ImageHeight image.size.height

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickToClipAndSave:(UIButton *)sender {
    UIImage *image = [UIImage imageNamed:@"header"];
    
    // 获取位图上下文：
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    // 获取图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(ImageWidth * 0.5, ImageHeight * 0.5);
    CGFloat radius = MIN(ImageWidth, ImageHeight) * 0.5;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    [image drawAtPoint:CGPointZero];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat x = 0;
    CGFloat y = (ImageHeight - 2 * radius) * 0.5;
    CGFloat width = 2 * radius;
    CGFloat height = width;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    x *= scale;
    y *= scale;
    width *= scale;
    height *= scale;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, width, height));
    image = [UIImage imageWithCGImage:imageRef];
    self.iconImageView.image = image;
    
    // 保存到相册：
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    // 保存至沙盒：
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"img.png"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:filePath atomically:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"%s", __func__);
    
    if (error) {
        NSLog(@"失败....");
    } else {
        NSLog(@"成功....");
    }
}

@end
