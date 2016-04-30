//
//  GoodsCell.h
//  01_团购简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoodsModel;

@interface GoodsCell : UITableViewCell

@property (nonatomic, strong) GoodsModel *goods;

+(instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end
