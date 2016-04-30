//
//  ContactCell.m
//  01_私人通讯录
//
//  Created by Chiang on 16/2/18.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ContactCell.h"
#import "ContactModel.h"

@interface ContactCell ()

@property (nonatomic, weak) UIView *separatorStyleView;

@end

@implementation ContactCell

-(void)setContact:(ContactModel *)contact {
    _contact = contact;
    
    self.textLabel.text = contact.contactName;
    self.detailTextLabel.text = contact.contactTel;
}

-(void)awakeFromNib {
    UIView *separatorStyleView = [[UIView alloc] init];
    [separatorStyleView setBackgroundColor:[UIColor blackColor]];
    separatorStyleView.alpha = 0.8;
    self.separatorStyleView = separatorStyleView;
    [self addSubview:separatorStyleView];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat height = 1;
    CGFloat width = self.bounds.size.width;
    CGFloat x = 0;
    CGFloat y = self.bounds.size.height - height;
    
    self.separatorStyleView.frame = CGRectMake(x, y, width, height);
}

@end
