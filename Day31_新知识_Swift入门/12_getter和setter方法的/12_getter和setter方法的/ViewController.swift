//
//  ViewController.swift
//  12_getter和setter方法的
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = Person()
        person.gender = "YaoMing"
        print(person.age)
    }
}

