//
//  ViewController.swift
//  08_关包相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func demo() {
        // 异步加载数据：
        dispatch_async(dispatch_get_main_queue()) {
            print("start....")
        }
    }

}

