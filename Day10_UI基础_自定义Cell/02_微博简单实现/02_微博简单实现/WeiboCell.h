//
//  WeiboCell.h
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiboFrameModel;

@interface WeiboCell : UITableViewCell

@property (nonatomic, strong) WeiboFrameModel *weiboFrameModel;

+(instancetype)weiboCellWithTableView:(UITableView *)tableView;

@end
