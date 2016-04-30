//
//  ViewController.m
//  5_scrollView的代理
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.contentSize = self.imageView.frame.size;
    self.scrollView.showsHorizontalScrollIndicator  =NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
}

- (IBAction)clickToChangeContentOffset {
    CGPoint offset = self.scrollView.contentOffset;
    offset.x += 20;
    offset.y += 20;
    
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - UIScrollViewDelegate:

// 滚动时调用：
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGPoint(self.scrollView.contentOffset));
}

// 开始拖拽时调用：
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"%s", __func__);
}

@end
