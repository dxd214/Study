//
//  Company.h
//  04_代理的使用
//
//  Created by SteveChiang on 16/1/29.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CompanyDelegate <NSObject>

-(void)needMaterials;

@end

@interface Company : UIView

@property (nonatomic, weak) id<CompanyDelegate> delegate;

@end
