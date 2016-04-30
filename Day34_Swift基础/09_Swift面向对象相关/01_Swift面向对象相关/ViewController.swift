//
//  ViewController.swift
//  01_Swift面向对象相关
//
//  Created by Chiang on 16/4/9.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let person = Person()
//        print(person.name, person.age)
//        
//        let student = Student()
//        print(student.name, student.age)
//        
//        let student2 = Student(name: "Howard", age: 30)
//        print(student2)
        
        let person = Person(dic)
    }

}

