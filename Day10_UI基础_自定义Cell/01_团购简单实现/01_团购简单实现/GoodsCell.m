//
//  GoodsCell.m
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "GoodsCell.h"
#import "GoodsModel.h"

@interface GoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;

@end

@implementation GoodsCell

+(instancetype)goodsCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseID = @"Goods";
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GoodsCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setGoods:(GoodsModel *)goods
{
    _goods = goods;
    self.iconImageView.image = [UIImage imageNamed:goods.icon];
    self.titleLabel.text = goods.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", goods.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"已有%@人购买", goods.buyCount];
}

@end
