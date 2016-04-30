//
//  ViewController.m
//  06_UICollectionView展示Hero
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"
#import "HeroCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *herosList;

@end

static NSString *reuseableID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.herosList);
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    [self.collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:reuseableID];
}

-(NSArray *)herosList
{
    if (!_herosList) {
        _herosList = [HeroModel herosArray];
    }
    return _herosList;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.herosList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseableID forIndexPath:indexPath];
    HeroModel *hero = self.herosList[indexPath.item];
    cell.hero = hero;
    [cell setBackgroundColor:[UIColor redColor]];
    
    return cell;
}

@end
