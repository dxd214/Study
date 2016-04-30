//
//  HeaderView.m
//  01_QQ好友分组
//
//  Created by SteveChiang on 16/2/2.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "HeaderView.h"
#import "FriendsGroupModel.h"

@interface HeaderView ()

@property (nonatomic, strong) UIButton *headerBtn;
@property (nonatomic, strong) UILabel *onlineLabel;

@end

@implementation HeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *headerBtn = [[UIButton alloc] init];
        //    [btn setBackgroundColor:[UIColor redColor]];
        [headerBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [headerBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [headerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [headerBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        // headerBtn的水平对其方式：
        headerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        headerBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        headerBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        // 图片旋转时尺寸保持不变：
        headerBtn.imageView.contentMode = UIViewContentModeCenter;
        //
        headerBtn.imageView.clipsToBounds = NO;
        [self addSubview:headerBtn];
        
        [headerBtn addTarget:self action:@selector(clickToFoldawayFriendsGroup:) forControlEvents:UIControlEventTouchUpInside];
        
        self.headerBtn = headerBtn;
        
        // 添加label：
        UILabel *onlineLabel = [[UILabel alloc] init];
        [headerBtn addSubview:onlineLabel];
        onlineLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:onlineLabel];
        self.onlineLabel = onlineLabel;
        
        NSLog(@"%@", NSStringFromCGRect(headerBtn.frame));
        NSLog(@"%@", NSStringFromCGRect(onlineLabel.frame));
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerBtn.frame = self.contentView.bounds;
    
    CGFloat onlineWidth = 120;
    CGFloat onlineHeight = 44;
    CGFloat onlineX = self.frame.size.width - onlineWidth;
    CGFloat onlineY = 0;
    self.onlineLabel.frame = CGRectMake(onlineX, onlineY, onlineWidth, onlineHeight);
}

-(void)setFriendsGroup:(FriendsGroupModel *)friendsGroup
{
    _friendsGroup = friendsGroup;
    
    [self.headerBtn setTitle:friendsGroup.name forState:UIControlStateNormal];
    self.onlineLabel.text = [NSString stringWithFormat:@"%ld / %ld", friendsGroup.online, friendsGroup.friends.count];
}

-(void)clickToFoldawayFriendsGroup:(UIButton *)headerBtn
{
    if ([self.delegate respondsToSelector:@selector(headerView:didClickClickGroupButton:)]) {
        [self.delegate headerView:self didClickClickGroupButton:self.headerBtn];
    }
}

-(void)setRevolveImageView:(BOOL)revolveImageView
{
    _revolveImageView = revolveImageView;
    
    if (revolveImageView) {
        // 旋转90度：
        self.headerBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        // 恢复：
        self.headerBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

@end
