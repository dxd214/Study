//
//  ViewController.m
//  02_微博简单实现
//
//  Created by SteveChiang on 16/2/1.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "WeiboModel.h"
#import "WeiboCell.h"
#import "WeiboFrameModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *weiboFramesList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSArray *)weiboFramesList
{
    if (nil == _weiboFramesList) {
        _weiboFramesList = [WeiboModel weiboFramesArray];
    }
    return _weiboFramesList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weiboFramesList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboFrameModel *weiboFrameModel = self.weiboFramesList[indexPath.row];
    WeiboCell *cell = [WeiboCell weiboCellWithTableView:tableView];
    cell.weiboFrameModel = weiboFrameModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboFrameModel *weiboFrameModel = self.weiboFramesList[indexPath.row];
    return weiboFrameModel.cellHeight;
}

@end
