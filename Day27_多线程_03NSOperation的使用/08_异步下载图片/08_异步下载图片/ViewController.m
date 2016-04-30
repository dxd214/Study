//
//  ViewController.m
//  08_异步下载图片
//
//  Created by Chiang on 16/2/23.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *appsList;
//@property (nonatomic, strong) NSOperationQueue *queue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", self.appsList);
}

//-(NSOperationQueue *)queue {
//    if (!_queue) {
//        _queue = [[NSOperationQueue alloc] init];
//    }
//    return _queue;
//}

-(NSArray *)appsList {
    if (!_appsList) {
        _appsList = [AppModel appsArray];
    }
    return _appsList;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseableID = @"Cell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseableID];

    AppModel *app = self.appsList[indexPath.row];
    cell.app = app;
    
//    if (app.iconImage) {
//        NSLog(@"foidfgjiojpgpgijfds----------->复用");
//    } else {
//        // 设置占位头像：
//        self.queue.maxConcurrentOperationCount = 3;
//        [self.queue addOperationWithBlock:^{
//            NSLog(@"<---------> %@", [NSThread currentThread]);
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"@<+++++++++>, %@", [NSThread currentThread]);
//                
//                //            cell.imageView.image = image;
//                //            cell.textLabel.text = app.name;
//                //            cell.detailTextLabel.text = [NSString stringWithFormat:@"已下载%@次", app.download];
//                cell.app = app;
//            }];
//        }];
//        
//        NSLog(@"ghfoughfioevoifegoeghiorehg------->下载");
//    }
    
    return cell;
}


@end
