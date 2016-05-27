//: Playground - noun: a place where people can play

import UIKit

let num = 15
if num == 10 {
    print("OK...")
} else {
    print("不OK....")
}

// OC中如果没有break的话，语句会穿透，但swift中不会。
// OC中default可以放在最开始，而swift只能放在最后。
// OC中default可以省略，swift不能省略。
switch (num) {
case 1:
    print(1)
    break
case 2:
    print(2)
    break
case 3:
    print(3)
    break
case 10:
    print(10)
    break
default:
    print("no search....")
    break
}