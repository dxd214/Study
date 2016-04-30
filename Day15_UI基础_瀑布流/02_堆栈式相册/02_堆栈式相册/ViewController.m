//
//  ViewController.m
//  02_堆栈式相册
//
//  Created by Chiang on 16/2/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "ImageFlowLayout.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

static NSString *reuseableID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImageFlowLayout *flowLayout = [[ImageFlowLayout alloc] init];
    CGFloat width = self.view.bounds.size.width;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 150, width, width) collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:reuseableID];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseableID forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    
    return cell;
}

@end
