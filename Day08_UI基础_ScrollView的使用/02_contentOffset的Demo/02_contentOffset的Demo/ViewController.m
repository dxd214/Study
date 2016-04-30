//
//  ViewController.m
//  02_contentOffset的Demo
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView setBackgroundColor:[UIColor orangeColor]];
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
}

- (IBAction)clickToChangeContentOffset {
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 20;
    offset.y += 20;
    
//    [UIView animateWithDuration:0.5f animations:^{
//        self.scrollView.contentOffset = offset;
//    }];
    
    [self.scrollView setContentOffset:offset animated:YES];
    NSLog(@"contentSize:%@ -- frame.size:%@", NSStringFromCGSize(self.scrollView.contentSize), NSStringFromCGSize(self.imageView.frame.size));
}

@end
