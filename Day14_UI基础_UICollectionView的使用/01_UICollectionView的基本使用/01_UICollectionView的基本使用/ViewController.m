//
//  ViewController.m
//  01_UICollectionView的基本使用
//
//  Created by SteveChiang on 16/2/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

static NSString *reuseID = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning 复用cell必须注册一个cell：
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseID];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
}

#pragma mark - UICollectionViewDataSource:

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate:

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld -- %ld", indexPath.section, indexPath.row);
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"xxxxxxxxx.....");
}

@end
