//
//  ViewController.m
//  02_城市选择
//
//  Created by Chiang on 16/2/15.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "ProvinceModel.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic, strong) NSArray *provincesList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
    
    NSLog(@"%@", self.provincesList);
}

-(NSArray *)provincesList
{
    if (!_provincesList) {
        _provincesList = [ProvinceModel provincesArray];
    }
    return _provincesList;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provincesList.count;
    } else {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        ProvinceModel *province = self.provincesList[selectedRow];
        return province.cities.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        ProvinceModel *province = self.provincesList[row];
        return province.name;
    } else {
        NSInteger selectedRow = [pickerView selectedRowInComponent:0];
        ProvinceModel *province = self.provincesList[selectedRow];
        return province.cities[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    
    NSInteger proSelRow = [pickerView selectedRowInComponent:0];
    self.provinceLabel.text = [self.provincesList[proSelRow] name];
    
    NSInteger citySelRow = [pickerView selectedRowInComponent:1];
    self.cityLabel.text = [self.provincesList[proSelRow] cities][citySelRow];
}

@end
