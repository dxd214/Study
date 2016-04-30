//
//  ViewController.m
//  03_图片剪裁并保存
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

- (IBAction)clickToClip:(UIButton *)sender {
    UIImage *image = [UIImage imageNamed:@"me"];
    // 开启一个bitmap上下文：
    UIGraphicsBeginImageContextWithOptions(image.size, YES, 0.0f);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(ImageWidth * 0.5, ImageHeight * 0.5);
    CGFloat radius = MIN(ImageWidth, ImageHeight) * 0.5;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CGContextAddPath(context, path.CGPath);
    CGContextClip(context);
    [image drawAtPoint:CGPointZero];
    
    // 绘制完成，获取图片：
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图形上下文：
    UIGraphicsEndImageContext();
    self.iconImageView.image = clipImage;
    // 将获取的图片保存到相册：
    UIImageWriteToSavedPhotosAlbum(clipImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // 保存到沙盒：
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"img.png"];
    // 将图片转换为NSData:
    NSData *imageData = UIImagePNGRepresentation(clipImage);
    [imageData writeToFile:filePath atomically:YES];
}

-(void)saveToAlbum {
    NSLog(@"%s", __func__);
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
