//
//  ViewController.m
//  04_归档和解档
//
//  Created by Chiang on 16/2/25.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    person.name = @"YaoMing";
    person.age = 34;
    
    // 归档：
    [NSKeyedArchiver archiveRootObject:person toFile:@"/Users/Chiang/Desktop/123.plist"];
    // 解档：
    person = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/Chiang/Desktop/123.plist"];
    
    NSLog(@"%@ - %d", person.name, person.age);
}

@end
