//
//  ViewController.m
//  04_新应用管理(xib)
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *appsList;

@end

static NSString *reuseID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    [collectionView setBackgroundColor:[UIColor whiteColor]];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    UINib *appNib = [UINib nibWithNibName:@"AppCell" bundle:nil];
    // 通过nib取出appCell对象：
    AppCell *cell = [[appNib instantiateWithOwner:nil options:nil] lastObject];
    flowLayout.itemSize = cell.frame.size;
    [collectionView registerNib:[UINib nibWithNibName:@"AppCell" bundle:nil] forCellWithReuseIdentifier:reuseID];
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
    AppModel *app = self.appsList[indexPath.row];
    return [AppCell appCellWithCollectionView:collectionView andReuseID:reuseID andIndexPath:indexPath andAppModel:app];
}

@end
