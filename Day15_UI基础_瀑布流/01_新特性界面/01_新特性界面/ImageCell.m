//
//  ImageCell.m
//  01_新特性界面
//
//  Created by Chiang on 16/2/14.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ImageCell.h"

@interface ImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@end

@implementation ImageCell

-(void)setIconImage:(UIImage *)iconImage
{
    _iconImage = iconImage;
    
    self.iconImageView.image = iconImage;
}

-(void)setIndex:(NSString *)index
{
    _index = index;
    
    self.indexLabel.text = index;
    self.indexLabel.textColor = [UIColor orangeColor];
}

@end
