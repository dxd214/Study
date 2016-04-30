//
//  ViewController.m
//  02_代码创建UICollectionView
//
//  Created by SteveChiang on 16/2/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

static NSString *reuseID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 代码创建collectionView时，必须为它添加一个layout：
//    UICollectionViewLayout * layout = [[UICollectionViewLayout alloc] init];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    [self.view addSubview:collectionView];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseID];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    return cell;
}

@end
