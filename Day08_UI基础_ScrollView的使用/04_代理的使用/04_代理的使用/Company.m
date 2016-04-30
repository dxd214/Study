//
//  Company.m
//  04_代理的使用
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self  = [super initWithFrame:frame]) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self addSubview:button];
        
        [button setBackgroundColor:[UIColor yellowColor]];
        [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)clickButton
{
    NSLog(@"需要原材料.....");
    
    // 通知代理，调用代理方法：
//    [self.delegate needMaterials];
    // 返回一个bool值，如果该对象实现了这个方法，则返回YES：
    if ([self.delegate respondsToSelector:@selector(needMaterials)]) {
        [self.delegate needMaterials];
    }
}

@end
