//
//  ViewController.m
//  08_xml的解析
//
//  Created by Chiang on 16/2/25.
//  Copyright © 2016年 Apple.Inc. All rights reserved.
//

#import "ViewController.h"
#import "Video.h"

@interface ViewController () <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *videosArray;
@property (nonatomic, strong) NSMutableString *elementsString;

@property (nonatomic, strong) Video *currentVideo;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSMutableArray *)videosArray {
    if (!_videosArray) {
        _videosArray = [NSMutableArray array];
    }
    return _videosArray;
}

-(NSMutableString *)elementsString {
    if (!_elementsString) {
        _elementsString = [NSMutableString string];
    }
    return _elementsString;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self loadData];
}

-(void)loadData {
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/Materials2/videos.xml"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 实例化一个xml解析器：
        NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
        // 设置代理：
        parser.delegate = self;
        // 开始解析：
        [parser parse];
    }];
}

#pragma mark - NSXMLParserDelegate

// 打开文档开始解析：
-(void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"%s", __func__);
    
    // 初始化数组容器：
    [self.videosArray removeAllObjects];
}

// 开始节点：
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"%s %@-%@", __func__, elementName, attributeDict);
    
    // 初始化模型对象：
    if ([elementName isEqualToString:@"video"]) {
        self.currentVideo = [[Video alloc] init];
        self.currentVideo.videoId = attributeDict[@"videoId"];
    }
    
    [self.elementsString setString:@""];
}

// 发现节点内容：
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"%s %@", __func__, string);
    
    [self.elementsString appendString:string];
}

// 结束节点：
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"%s", __func__);
    
    if ([elementName isEqualToString:@"name"]) {
        self.currentVideo.name = self.elementsString;
    } else if ([elementName isEqualToString:@"length"]) {
        self.currentVideo.length = 
    }
}

// 关闭文档：
-(void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"%s", __func__);
}

@end
