//
//  ViewController.swift
//  06_字典相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        demo1()
    }
    
    func demo1() {
        var dict = ["name":"郭敬明", "height":"1.4"]
        print(dict)
        let name = dict["name"]
        print(name)
        
        // 增加元素：
        dict["title"] = "灌篮高手"
        print(dict)
        
        // 遍历字典：
        for (key, value) in dict {
            print("key = \(key)")
            print("value = \(value)")
        }
    }

}

