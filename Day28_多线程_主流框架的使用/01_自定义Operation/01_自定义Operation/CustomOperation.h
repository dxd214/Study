//
//  CustomOperation.h
//  01_自定义Operation
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomOperation;

@protocol CustomOperationDelegate <NSObject>

@optional;
-(void)customOperation:(CustomOperation *)customOperation didFinishedDownloadImage:(UIImage *)image;

@end

@interface CustomOperation : NSOperation

@property (nonatomic, weak) id<CustomOperationDelegate> delegate;

@end
