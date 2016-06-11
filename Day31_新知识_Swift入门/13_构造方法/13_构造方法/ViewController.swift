//
//  ViewController.swift
//  13_构造方法
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person =  Person()
        print(person.name, person.age)
        
        let person2 = Person(name: "YiJianLian", age: 28)
        print(person2.name, person2.age)
    }
}

