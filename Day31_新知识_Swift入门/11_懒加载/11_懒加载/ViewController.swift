//
//  ViewController.swift
//  11_懒加载
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var array: [String] = {
        return ["1", "2", "3", "4", "5"]
    }()
    
    lazy var button: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.backgroundColor = UIColor.orangeColor()
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(array)
        
        view.addSubview(button)
    }

}

