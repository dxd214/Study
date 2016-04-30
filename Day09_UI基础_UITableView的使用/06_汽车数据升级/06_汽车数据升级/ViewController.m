//
//  ViewController.m
//  06_汽车数据升级
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CarGroupModel.h"
#import "CarModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *carGroupsList;
// 用于存放索引：
@property (nonatomic, strong) NSMutableArray *indexsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSArray *)carGroupsList
{
    if (!_carGroupsList) {
        _carGroupsList = [CarGroupModel carGroupsArray];
    }
    // 将title对应的value存入数组：
    self.indexsArray = [_carGroupsList valueForKeyPath:@"title"];
    return _carGroupsList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroupsList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarGroupModel *carGroup = self.carGroupsList[section];
    return carGroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    CarGroupModel *carGroup = self.carGroupsList[indexPath.section];
    CarModel *car = carGroup.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarGroupModel *carGroup = self.carGroupsList[section];
    return carGroup.title;
}

// 返回索引：
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.indexsArray;
}

@end
