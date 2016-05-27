//: Playground - noun: a place where people can play

import UIKit

let num1 = 10
let num2 = 9.9
// swift没有隐式类型转换。
//let num3 = num1 + num2

let num3 = Double(num1) + num2
print(num3)

let num4: Int = 10