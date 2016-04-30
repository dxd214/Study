//
//  NewViewController.h
//  09_模态出控制器
//
//  Created by Chiang on 16/3/4.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewViewController;

@protocol NewViewControllerDelegate <NSObject>

-(void)newViewControllerDidDismissWith:(NewViewController *)newViewController;

@end

@interface NewViewController : UIViewController

@property (nonatomic, weak) id<NewViewControllerDelegate> delegate;

@end
