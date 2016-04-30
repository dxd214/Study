//
//  ViewController.m
//  01_团购简单实现
//
//  Created by SteveChiang on 16/1/31.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "GoodsModel.h"
#import "GoodsCell.h"
#import "BannerView.h"
#import "FooterView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, FooterViewDelegate>

@property (nonatomic, strong) NSMutableArray *goodsList;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 70;
    self.tableView = tableView;
    
    // 设置tableview的headerview时，headerview的宽度没有用：
    BannerView *bannerView = [[BannerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
//    [bannerView setBackgroundColor:[UIColor yellowColor]];
    tableView.tableHeaderView = bannerView;
    
    // 传递数据：
    NSMutableArray *dataArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"ad_%02d", i];
        NSLog(@"%@", imageName);
        [dataArray addObject:imageName];
    }

    bannerView.imagesArray = dataArray;
    
    
    NSLog(@"%@", self.goodsList);
    
    FooterView *footerView = [FooterView footerView];
    tableView.tableFooterView = footerView;
    
    footerView.delegate = self;
}

-(NSMutableArray *)goodsList
{
    if (!_goodsList) {
        _goodsList = [GoodsModel goodsArray];
    }
    return _goodsList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsModel *goods = self.goodsList[indexPath.row];
    GoodsCell *cell = [GoodsCell goodsCellWithTableView:tableView];
    cell.goods = goods;
    return cell;
}

-(void)footerView:(FooterView *)footerView andLoadingBtn:(UIButton *)loadingBtn andLoadingView:(UIView *)loadingView
{
    NSLog(@"%s", __func__);
//    for (int i = 0; i < 3; i++) {
        GoodsModel *goods = self.goodsList[0];
        [self.goodsList addObject:goods];
//    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.goodsList.count - 1 inSection:0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        loadingBtn.hidden = NO;
        loadingView.hidden = YES;
        
        // 滚动到最后一行：
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:    UITableViewScrollPositionBottom animated:YES];
    });
}

@end
