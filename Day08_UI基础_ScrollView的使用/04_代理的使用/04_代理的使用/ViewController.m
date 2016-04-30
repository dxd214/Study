//
//  ViewController.m
//  04_代理的使用
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "Company.h"

@interface ViewController () <CompanyDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Company *company = [[Company alloc] initWithFrame:CGRectMake(50, 100, 150, 150)];
    [company setBackgroundColor:[UIColor redColor]];
    
    company.delegate = self;
    
    [self.view addSubview:company];
}

#pragma mark - CompanyDelegate:

-(void)needMaterials
{
    NSLog(@"Materials is comming");
}

@end
