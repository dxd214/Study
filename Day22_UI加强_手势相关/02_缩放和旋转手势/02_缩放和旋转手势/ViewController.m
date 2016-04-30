//
//  ViewController.m
//  02_缩放和旋转手势
//
//  Created by Chiang on 16/3/9.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // <-------------------捏合手势：-------------------->
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinTouch:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    
    // <--------------------旋转手势：--------------------------->
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationTouch:)];
    rotation.delegate = self;
    [self.imageView addGestureRecognizer:rotation];
}

-(void)rotationTouch:(UIRotationGestureRecognizer *)ro {
    NSLog(@"%f", ro.rotation);
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, ro.rotation);
    ro.rotation = 0;
//    self.imageView.transform = CGAffineTransformMakeRotation(ro.rotation);
}

-(void)pinTouch:(UIPinchGestureRecognizer *)pin {
    NSLog(@"%lf", pin.scale);
    
//    self.imageView.transform = CGAffineTransformMakeScale(pin.scale, pin.scale);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pin.scale, pin.scale);
    pin.scale = 1;
}

#pragma mark - UIGestureRecognizerDelegate

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
