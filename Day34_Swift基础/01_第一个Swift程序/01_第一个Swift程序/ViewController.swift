//
//  ViewController.swift
//  01_第一个Swift程序
//
//  Created by Chiang on 16/4/8.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        redView.backgroundColor = UIColor.redColor();
        view.addSubview(redView);
        
        // 添加一个button：
        let button = UIButton(type: UIButtonType.ContactAdd);
        button.center = redView.center;
        view.addSubview(button);
        
//        let image = UIImage(named: )
    }
}

