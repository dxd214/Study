//
//  ViewController.m
//  01_新特性界面
//
//  Created by Chiang on 16/2/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSArray *imagesArray;
@property (nonatomic, strong) NSArray *indexsArray;

@end

static NSString *reuseableID = @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.flowLayout.itemSize = self.view.bounds.size;
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    
    NSLog(@"%@", self.imagesArray);
    NSLog(@"%@", self.indexsArray);
}

-(NSArray *)imagesArray
{
    if (!_imagesArray) {
        NSMutableArray *tempArray = [NSMutableArray array];
        NSMutableArray *indexTempArray = [NSMutableArray array];
        for (int i = 0; i < 9; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%d.jpg", i];
            [tempArray addObject:imageName];
            
            NSString *index = [NSString stringWithFormat:@"%d / 9", i + 1];
            [indexTempArray addObject:index];
        }
        _imagesArray = tempArray;
        _indexsArray = indexTempArray;
    }
    return _imagesArray;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseableID forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor orangeColor]];
    
    NSString *imageName = self.imagesArray[indexPath.item];
    NSString *index = self.indexsArray[indexPath.item];
    cell.iconImage = [UIImage imageNamed:imageName];
    cell.index = index;
    
    return cell;
}

@end
