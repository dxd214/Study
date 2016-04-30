//
//  AppCell.m
//  04_新应用管理(xib)
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@interface AppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation AppCell

+(instancetype)appCellWithCollectionView:(UICollectionView *)collectionView andReuseID:(NSString *)reuseID andIndexPath:(NSIndexPath *)indexPath andAppModel:(AppModel *)app
{
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.app = app;
    return cell;
}

-(void)setApp:(AppModel *)app
{
    _app = app;
    
    self.iconImageView.image = [UIImage imageNamed:app.icon];
    self.nameLabel.text = app.name;
}

@end
