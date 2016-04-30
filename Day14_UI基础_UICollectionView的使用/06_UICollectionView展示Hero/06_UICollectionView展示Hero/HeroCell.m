//
//  HeroCell.m
//  06_UICollectionView展示Hero
//
//  Created by Chiang on 16/2/13.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "HeroCell.h"
#import "HeroModel.h"

@interface HeroCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;

@end

@implementation HeroCell

-(void)setHero:(HeroModel *)hero
{
    _hero = hero;
    self.iconImageView.image = [UIImage imageNamed:hero.icon];
    self.nameLabel.text = hero.name;
    self.introLabel.text = hero.intro;
}

@end
