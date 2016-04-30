//
//  ViewController.m
//  05_手势解锁Demo
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "UnlockView.h"

@interface ViewController () <UnlockViewDelegate>

@property (weak, nonatomic) IBOutlet UnlockView *unlockView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.unlockView.delegate = self;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)unlockViewGetPassWordWithUnlockView:(UnlockView *)unlockView andPassword:(NSString *)password {
    NSLog(@"<---------%@--------->", password);
    
    UIGraphicsBeginImageContextWithOptions(self.unlockView.frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.unlockView.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.imageView.image = image;
    
}

@end
