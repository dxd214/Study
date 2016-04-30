//
//  ViewController.m
//  03_汽车数据展示
//
//  Created by SteveChiang on 16/1/30.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "CarModel.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *carsList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(NSArray *)carsList
{
    if (!_carsList) {
        _carsList = [CarModel carsArray];
    }
    return _carsList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carsList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CarModel *car = self.carsList[section];
    return car.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    
    CarModel *carsGroup = self.carsList[indexPath.section];
    NSString *carName = carsGroup.cars[indexPath.row];
    cell.textLabel.text = carName;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    CarModel *car = self.carsList[section];
    return car.title;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    CarModel *car = self.carsList[section];
    return car.desc;
}

@end
