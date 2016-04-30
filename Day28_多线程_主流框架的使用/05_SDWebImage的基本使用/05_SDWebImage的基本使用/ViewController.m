//
//  ViewController.m
//  05_SDWebImage的基本使用
//
//  Created by Chiang on 16/2/24.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "UIImage+GIF.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self test1];
    [self test2];
}

/**
 *  从网络下载图片：
 */
-(void)test1 {
    NSString *imageURL = @"http://g.hiphotos.baidu.com/zhidao/pic/item/9f510fb30f2442a79fbc68ded343ad4bd113021e.jpg";
    
    /**
     1、图片下载地址；
     2、占位图；
     3、可选项；
     4、进度；
     5、完成后执行的代码；
     */
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        // receivedSize已经加载的数据量；
        // expectedSize总数据量；
//        NSLog(@"receivedSize-%tu,,,expectedSize-%tu", receivedSize, expectedSize);
        NSLog(@"%ld", receivedSize * 100 / expectedSize);
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSLog(@"finished....");
    }];
}

/**
 *  播放gif图片：
 */
-(void)test2 {
    UIImage *gifImage = [UIImage sd_animatedGIFNamed:@"sb"];
    self.gifImageView.image = gifImage;
}

@end
