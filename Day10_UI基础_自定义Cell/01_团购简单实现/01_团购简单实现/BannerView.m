//
//  BannerView.m
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation BannerView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupScrollView];
        [self setupPageControl];
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupScrollView];
        [self setupPageControl];
    }
    return self;
}

-(void)setupScrollView
{
    // 初始化scrollView：
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    
    // 翻页：
    scrollView.pagingEnabled = YES;
    // 隐藏滚动条：
    scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView = scrollView;
}

-(void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.5, 20)];
    pageControl.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.9);
    [self addSubview:pageControl];
    
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    
    // 当前页码：
    pageControl.currentPage = 0;
    self.pageControl = pageControl;
}

-(void)setImagesArray:(NSArray *)imagesArray
{
    _imagesArray = imagesArray;
    CGSize bannerSize = self.frame.size;
    NSInteger count = imagesArray.count;
    
    for (int i = 0; i < count; i++) {
        NSString *imageName = imagesArray[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * bannerSize.width, 0, bannerSize.width, bannerSize.height)];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(imagesArray.count * bannerSize.width, 0);
    self.pageControl.numberOfPages = count;
}

@end
