//
//  AppCell.m
//  03_新应用管理
//
//  Created by SteveChiang on 16/2/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"

@interface AppCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation AppCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self setBackgroundColor:[UIColor orangeColor]];
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
//        [iconImageView setBackgroundColor:[UIColor redColor]];
        [self addSubview:iconImageView];
        self.iconImageView = iconImageView;
        

        UILabel *nameLabel = [[UILabel alloc] init];
//        [nameLabel setBackgroundColor:[UIColor grayColor]];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize cellSize = self.frame.size;
    NSLog(@"%@", NSStringFromCGSize(cellSize));
    
    CGFloat iconWidth = cellSize.width * 0.7;
    CGFloat iconHeight = iconWidth;
    CGFloat iconX = (cellSize.width - iconWidth) * 0.5;
    CGFloat iconY = 0;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    
    CGFloat nameWidth = cellSize.width;
    CGFloat nameHeight = cellSize.height - iconHeight;
    CGFloat nameX = 0;
    CGFloat nameY = CGRectGetMaxY(self.iconImageView.frame);
    self.nameLabel.frame = CGRectMake(nameX, nameY, nameWidth, nameHeight);
}

-(void)setApp:(AppModel *)app
{
    _app = app;
    
    self.nameLabel.text = app.name;
    self.iconImageView.image = [UIImage imageNamed:app.icon];
}

@end
