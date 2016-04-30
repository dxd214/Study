//
//  ViewController.m
//  03_喜马拉雅
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *lastImageView;
@property (weak, nonatomic) IBOutlet UIView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.lastImageView.frame));
    
    self.scrollView.contentInset = UIEdgeInsetsMake(38, 0, 0, 0);
    self.scrollView.contentOffset = CGPointMake(0, -38);
}

@end
