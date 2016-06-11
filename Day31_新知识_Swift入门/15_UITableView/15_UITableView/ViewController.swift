//
//  ViewController.swift
//  15_UITableView
//
//  Created by JiangDi on 16/5/27.
//  Copyright © 2016年 Google. All rights reserved.
//

import UIKit

private let reuseID = "CELL"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let tb = UITableView()
        tb.dataSource = self
        tb.delegate = self
        self.view = tb
    }
    
    private lazy var array: [String] = {
        return ["YaoMing", "YiJianLian", "WangZhiZhi", "SunYue", "ZhouQi", "GuoAiLun", "MaJian"]
    }()
}

extension ViewController {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseID)
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: reuseID)
        }
        let str = array[indexPath.row]
        cell?.textLabel?.text = str
        return cell!
    }
}

