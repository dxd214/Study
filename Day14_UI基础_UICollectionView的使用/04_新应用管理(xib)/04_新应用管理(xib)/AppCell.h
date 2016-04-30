//
//  AppCell.h
//  04_新应用管理(xib)
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppModel;

@interface AppCell : UICollectionViewCell

@property (nonatomic, strong) AppModel *app;

+(instancetype)appCellWithCollectionView:(UICollectionView *)collectionView andReuseID:(NSString *)reuseID andIndexPath:(NSIndexPath *)indexPath andAppModel:(AppModel *)app;

@end
