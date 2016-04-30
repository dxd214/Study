//
//  CustomOperation.h
//  01_自定义Operation
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomOperation : NSOperation

// 图片下载完成后调用的block：
@property (nonatomic, copy) void (^finishedBlock)(UIImage *image);

@property (nonatomic, copy) NSString *imageURL;

+(instancetype)downloadImageOperationWithImageURL:(NSString *)imageURL andfinishedBlock:(void (^)(UIImage *image))finishedBlock;

@end
