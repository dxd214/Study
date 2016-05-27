//
//  ViewController.swift
//  10_闭包
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test1 { 
//            print("+++++----")
//        }
        let scrollView = createScrollView { () -> Int in
            return 50
        }
        view.addSubview(scrollView)
    }
    
    func createScrollView(count: () -> Int) -> UIScrollView {
        // 创建scrollView
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 150, width: UIScreen.mainScreen().bounds.width, height: 70))
        scrollView.backgroundColor = UIColor.orangeColor()
        
        // 添加若干按钮：
        let width = 50
        let count = count()
        for i in 0..<count {
            let btn = UIButton()
            btn .setTitle("标题\(i + 1)", forState: .Normal)
            btn.frame = CGRect(x: i * width, y: 0, width: width, height: width)
            btn.titleLabel?.font = UIFont.systemFontOfSize(15.0)
            btn.backgroundColor = UIColor.blueColor()
            scrollView.addSubview(btn)
        }
        
        scrollView.contentSize = CGSize(width: width * count, height: width)
        return scrollView
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dispatch_async(dispatch_get_main_queue()) { 
            print("好冷啊...我在东北玩泥巴...虽然东北不大...我在大连没有家....")
        }
    }
    
    // 基本的闭包：
    func test1(finished: ()-> ()) {
        finished()
    }

    // 有参有返回值的闭包：
    
}

