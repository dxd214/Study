//
//  ImageFlowLayout.m
//  02_堆栈式相册
//
//  Created by Chiang on 16/2/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ImageFlowLayout.h"

@implementation ImageFlowLayout

-(instancetype)init
{
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    attributes.transform =
    return @[attributes];
}

// 此方法相当于layoutSubviews：
-(void)prepareLayout
{
    [super prepareLayout];
    
    CGSize collectionSize = self.collectionView.frame.size;
    CGFloat itemWidth = collectionSize.width * 0.6;
    CGFloat itemHeight = collectionSize.height * 0.8;
    self.itemSize = CGSizeMake(itemWidth, itemHeight);
}

@end
