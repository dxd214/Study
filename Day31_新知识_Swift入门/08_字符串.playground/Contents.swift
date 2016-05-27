//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var str2: String = "YaoMing"

// 字符串拼接：
let newStr = str + str2

// 用\()来拼接其它值：
let name = "YaoMing"
let age = 15
var str3 = "name = \(name) age = \(age)"
print(str3)

var str4 = String(format: "%02d: %02d: %02d", arguments: [9, 7, 3])

// swift中截取字符串建议用OC的方式截取，用swift的方式来截取非常复杂。
var str5: NSString = "YaoMingYue"
var str6 = "ZhongHanLiang" as NSString
// 截取：
var subStr = str6.substringWithRange(NSMakeRange(2, 5))
print(subStr)

// swift的字符串是可以直接遍历的：
let str7 = "AXinBeiJiaNongXieNaDe"
for c in str7.characters {
    print(c)
}


