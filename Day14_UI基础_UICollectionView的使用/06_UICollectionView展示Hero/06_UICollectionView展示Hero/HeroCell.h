//
//  HeroCell.h
//  06_UICollectionView展示Hero
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeroModel;

@interface HeroCell : UICollectionViewCell

@property (nonatomic, strong) HeroModel *hero;

@end
