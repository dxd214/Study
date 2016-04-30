//
//  ViewController.m
//  01_UIPickerView的基本使用
//
//  Created by Chiang on 16/2/10.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *stapleFoodLabel;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *orderPickerView;

@property (nonatomic, strong) NSArray *foodsList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.foodsList);
    
    for (int i = 0; i < 3; i++) {
        [self pickerView:self.orderPickerView didSelectRow:0 inComponent:i];
    }
}

-(NSArray *)foodsList
{
    if (!_foodsList) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"01foods.plist" ofType:nil];
        _foodsList = [NSArray arrayWithContentsOfFile:path];
    }
    return _foodsList;
}

- (IBAction)clickToHappenOrder {
    for (int i = 0; i < 3; i++) {
        NSInteger count = [self.foodsList[i] count];
        NSInteger number = arc4random_uniform((int)count);

        NSInteger selectedRow = [self.orderPickerView selectedRowInComponent:i];
        while (number == selectedRow) {
            number = arc4random_uniform((int)count);
        }
        [self.orderPickerView selectRow:number inComponent:i animated:YES];
        
        [self pickerView:self.orderPickerView didSelectRow:number inComponent:i];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foodsList.count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    NSArray *groupsList = self.foodsList[component];
    return groupsList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *groupsList = self.foodsList[component];
    return groupsList[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *foodName = self.foodsList[component][row];
    if (component == 0) {
        self.fruitLabel.text = foodName;
    } else if (component == 1) {
        self.stapleFoodLabel.text = foodName;
    } else {
        self.drinkLabel.text = foodName;
    }
}

@end
