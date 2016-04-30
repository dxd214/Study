//
//  ViewController.swift
//  05_数组相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        demo1()
        demo2()
    }
    
    func demo1() {
        // 数组中不建议存放类型不相同的对象；
        var array = ["姚明", "郭敬明", "灌篮高手郭敬明", 15]
    
        
        // 往数组中添加元素：
        array.append("凤姐")
        
        // 遍历：
        for str in array {
            print(str)
        }
        
        // 修改元素：
        array[0] = "梁小龙"
        print(array)
        
        // 移除数组中元素
        array .removeFirst()
        array .removeLast()
        print(array)
    }
    
    // 数组拼接：
    func demo2() {
        let arr1 = ["阿玛尼"]
        let arr2 = ["纪梵希"]
        print(arr1 + arr2)
    }
}

