//
//  WeiboCell.m
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboFrameModel.h"
#import "WeiboModel.h"

@interface WeiboCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *vipImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *pictureImageView;

@end

@implementation WeiboCell

+(instancetype)weiboCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"Weibo";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (nil == cell) {
        cell = [[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UIImageView *vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        UILabel *contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
    }
    return self;
}

-(void)setWeiboFrameModel:(WeiboFrameModel *)weiboFrameModel
{
    _weiboFrameModel = weiboFrameModel;
    
    WeiboModel *weibo = weiboFrameModel.weibo;
    self.iconImageView.image = [UIImage imageNamed:weibo.icon];
    self.nameLabel.text = weibo.name;
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    self.contentLabel.text = weibo.text;
    self.pictureImageView.image = [UIImage imageNamed:weibo.picture];
    
    self.iconImageView.frame = weiboFrameModel.iconFrame;
    self.nameLabel.frame = weiboFrameModel.nameFrame;
    self.vipImageView.frame = weiboFrameModel.vipFrame;
    self.contentLabel.frame = weiboFrameModel.textFrame;
    self.pictureImageView.frame = weiboFrameModel.pictureFrame;

}

@end
