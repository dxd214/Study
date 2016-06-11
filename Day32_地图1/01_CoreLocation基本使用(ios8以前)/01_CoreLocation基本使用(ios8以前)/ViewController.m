//
//  ViewController.m
//  01_CoreLocation基本使用(ios8以前)
//
//  Created by JiangDi on 16/6/9.
//  Copyright © 2016年 Google. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation ViewController

-(CLLocationManager *)manager {
    if (!_manager) {
        _manager = [[CLLocationManager alloc] init];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // 创建位置管理者：
    self.manager.delegate = self;
    // 更新用户位置：
    // 此方法会在后台不断获取用户位置信息：
    [self.manager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

// 当获取用户位置信息时调用：
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if (locations) {
        NSLog(@"定位成功....");
    }
}

@end
