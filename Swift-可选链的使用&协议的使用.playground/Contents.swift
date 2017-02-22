//: Playground - noun: a place where people can play

import UIKit

// MARK:- 可选链
/*
 它的可选性体现于请求或调用的目标当前可能为空（nil）
 如果可选的目标有值，那么调用就会成功；
 如果选择的目标为空（nil），则这种调用将返回空（nil）
 多次调用被链接在一起形成一个链，如果任何一个节点为空（nil）将导致整个链失效。
 可选链的使用
 在可选类型后面放一个问号，可以定义一个可选链。
 这一点很像在可选值后面放一个叹号来强制拆得其封包内的值
 它们的主要的区别在于当可选值为空时可选链即刻失败
 然而一般的强制解析将会引发运行时错误。
 因为可选链的结果可能为nil,可能有值.因此它的返回值是一个可选类型.
 可以通过判断返回是否有值来判断是否调用成功
 有值,说明调用成功
 为nil,说明调用失败
 
 */

/*
 1> 从可选链中进行取值?.
 2> 给可选链进行赋值
 3> 可选链调用方法
 */
class Person {
    var name = ""
    var dog : Dog?
}

class Dog {
    var weight = 0.0
    var toy : Toy?
}

class Toy {
    var price = 0.0
    
    func flying() {
        print("猪在飞")
    }
}
// 创建对象
let p = Person()
p.name = "lwy"

let d = Dog()
d.weight = 5.0

let t = Toy()
t.price = 10.0

p.dog = d
d.toy = t


// 3.可选链的使用
// 3.1.取出person的狗的玩具的价格
/*
 该写法非常危险:
 let dog = p.dog
 let toy = dog!.toy
 let price = toy!.price
 */

/*
 该写法非常麻烦
 if let dog = p.dog {
 if let toy = dog.toy {
 let price = toy.price
 }
 }
 */
// ?.就是可选链: 系统会自动判断该可选类型是否有值
// 如果有值,则解包, 如果没有值, 则赋值为nil
// 注意: 可选链条获取的值,一定是一个可选类型
if let price = p.dog?.toy?.price { // Double/nil
    print(price)
}

let price = p.dog?.toy?.price


// 3.2.给person的狗的玩具赋值一个新的价格
// 如果可选链中有一个可选类型是没有值, 那么语句直接不执行
p.dog?.toy?.price = 50


// 3.3.可选链调用方法
/*
 该写法太麻烦
 if let dog = p.dog {
 if let toy = dog.toy {
 toy.flying()
 }
 }
 */

p.dog?.toy?.flying()


// MARK:- 协议的使用

/*
 1> 协议的定义
 2> 如何类遵守协议
 3> 协议在代理设计模式中如何使用
 4> 协议中方法的可选性
 protocol前面需要加上@objc
 方法前面加上 @objc optional
 */

// 1.协议的定义
protocol SportProtocol {
    // 默认情况下 协议中的方法都试必须实现的方法
    func playBasketball()
    func playFootball()
}
//2. 定义类 并遵守协议
// 2.1 没有父类 遵守协议
class Teacher : SportProtocol {
    func playFootball() {
        print("playFootball")
    }
    func playBasketball() {
        print("playBasketball")
    }
}
// 2.2 有父类 遵守协议
class Student: NSObject, SportProtocol {
    func playBasketball() {
        
        print("playBasketball")
    }
    func playFootball() {
        print("playFootball")
        
    }
}

// 3. 协议在代理模式中的使用
/*
 定义协议时， 协议后面最好跟上 :class
 delegate的属性最好用weak 防止循环引用
 */
protocol BuyTicketDelegate : class {
    func buyTicket()
}

class Man {
    //定义代理属性
    weak var delegate : BuyTicketDelegate?

    func goToBeijing () {
        delegate?.buyTicket()
    }
}



// 4. 如何让协议中的方法是可选方法
// OC中是optional，在swift中， 如果协议中有可选方法， 那么必须在protocol前面加@objc, 也需要在optional前面加@objc

@objc protocol TestProtocol  {
    @objc optional func test()
}

class Cat : TestProtocol {
    weak var delegate : TestProtocol?
    func test() {
        
        print("可选方法")
    }
}