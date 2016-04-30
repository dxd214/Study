//
//  ViewController.m
//  03_新应用管理
//
//  Created by SteveChiang on 16/2/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *appsList;
@property (nonatomic, weak) UICollectionViewFlowLayout *flowLayout;

@end

static NSString *reuseID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(40, 10, 0, 10);
    // 最小列之间的间距：
//    flowLayout.minimumInteritemSpacing = 50;
    flowLayout.minimumLineSpacing = 50;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    self.flowLayout = flowLayout;
    
    [self.view addSubview:collectionView];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    [collectionView registerClass:[AppCell class] forCellWithReuseIdentifier:reuseID];
}

-(NSArray *)appsList
{
    if (!_appsList) {
        _appsList = [AppModel appsArray];
    }
    return _appsList;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.appsList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    AppModel *app = self.appsList[indexPath.item];
    cell.app = app;
    
    return cell;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.flowLayout.itemSize = CGSizeMake(300, 300);
}

@end
