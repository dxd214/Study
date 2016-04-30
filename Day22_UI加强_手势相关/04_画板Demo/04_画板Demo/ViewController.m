//
//  ViewController.m
//  04_画板Demo
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "DrawingBoardView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *lineWidthSlider;
@property (strong, nonatomic) IBOutlet DrawingBoardView *drawingBoardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置默认线宽度：
    self.drawingBoardView.lineWidth = self.lineWidthSlider.value;
}

// 隐藏状态栏：
-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)sliderToChangeTheLineWidth:(UISlider *)sender {
    self.drawingBoardView.lineWidth = sender.value;
}

/**
 设置颜色：
 */
- (IBAction)clickToChangeTheColorToRedColor:(UIButton *)sender {
    self.drawingBoardView.lineColor = [UIColor redColor];
}

- (IBAction)clickToChangeTheColorToBlueColor:(UIButton *)sender {
    self.drawingBoardView.lineColor = [UIColor blueColor];
}

- (IBAction)clickToChangeTheColorToGreenColor:(UIButton *)sender {
    self.drawingBoardView.lineColor = [UIColor greenColor];
}

- (IBAction)clickToClearDisplay:(UIBarButtonItem *)sender {
    [self.drawingBoardView clearDisplay];
}

- (IBAction)clickToComeBack:(UIBarButtonItem *)sender {
    [self.drawingBoardView comeBack];
}

- (IBAction)clickToUseRubber:(UIBarButtonItem *)sender {
    [self.drawingBoardView useRubber];
}

- (IBAction)clickToSaveInAlbum:(UIBarButtonItem *)sender {
    // 开启图形上下文对象：
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.drawingBoardView.layer renderInContext:context];
    
    UIImage *getImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(getImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error) {
        NSLog(@"保存失败....");
    } else {
        NSLog(@"保存成功....");
    }
}

@end
