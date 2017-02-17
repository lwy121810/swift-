//: Playground - noun: a place where people can play

import UIKit

//枚举类型
/*
 概念介绍
 枚举定义了一个通用类型的一组相关的值，使你可以在你的代码中以一个安全的方式来使用这些值。
 在 C/OC 语言中枚举指定相关名称为一组整型值
 Swift 中的枚举更加灵活，不必给每一个枚举成员提供一个值.也可以提供一个值是字符串，一个字符，或是一个整型值或浮点值
 枚举类型的语法
 使用enum关键词并且把它们的整个定义放在一对大括号内
 enum SomeEnumeration {
 // enumeration definition goes here
 }
 */

// 比如下面我们创建了一个方向的枚举
/*
 case关键字表明新的一行成员值将被定义
 不像C和OC一样 Swift的枚举成员在创建时不会被赋予一个默认的整数值
 在下面的例子中，North,Sourth,East,West不是隐式的等于0，1，2，3
 */
enum CompassPoint {
    case North
    case South
    case East
    case West
}
// 方法二: 多个成员可以在同一行上
enum Planet : Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//赋值
/*
 1.枚举类型赋值可以是字符串、字符、整型、浮点型
 2.注意：如果有给枚举类型赋值，则必须在枚举类型的后面明确说明具体的类型
 */
enum Direction : Int {
    case North = 1
    case Sourth = 2
    case East = 3
    case West = 4
}

enum Seasons : Int {
    case Spring = 1, Summer, Autumn,Winter
}

//枚举类型的使用
let p = Seasons(rawValue: 2)

let q = Seasons(rawValue: 2)


//结构体
/*
 结构体(struct)是由一系列具有相同类型或不同类型的数据构成的数据集合
 结构体(struct)是一种数据结构
 结构体是值类型，在方法中传递是值传递
 */
//结构体的定义格式
struct 结构体名称 {
    
}

//结构体的使用
//定义
//初始化结构体
struct WYLocation {
    var x : Double
    var y : Double
}
//创建结构体
let loc = WYLocation(x: 90,y: 90)

//结构体的增强
/*
 扩充构造函数
 默认情况下创建Location时使用Location(x: x值, y: y值)
 但是为了让我们在使用结构体时更加的灵活,swift还可以对构造函数进行扩充
 扩充的注意点
 在扩充的构造函数中必须保证成员变量是有值的
 扩充的构造函数会覆盖原有的构造函数
 */
struct Location {
    var x : Double
    var y : Double
    init(x : Double, y : Double) {
        self.x = x
        self.y = y
    }
    init(xyString : String) {
        let strs = xyString.components(separatedBy: ",")
        x = Double(strs.first!)!
        y = Double(strs.last!)!
    }
}
let location = Location(x: 100, y: 100)
let location1 = Location(xyString: "100,100")


//为结构体扩充方法
/*
 为了让结构体使用更加灵活,swift的结构体中可以扩充方法
 例子:为了Location结构体扩充两个方法
 向水平方向移动的方法
 向垂直方向移动的方法
 */

struct LLocation {
    var x : Double
    var y : Double
    init(x : Double, y : Double) {
        self.x = x
        self.y = y
    }
    init(xyString : String) {
        let strs = xyString.components(separatedBy: ",")
        x = Double(strs.first!)!
        y = Double(strs.last!)!
    }
    mutating func moveH(x : Double) {
        self.x += x
    }
    mutating func moveV(y : Double) {
        self.y += y
    }
}
//注意
/**
 如果我们使用的Location不是自己定义的，但是我们仍旧希望在自己的项目里扩展Location的操作
 Swift也能帮我们达成，这个机制，叫做extension
 */
extension Location {
    mutating func moveH(x : Double) {
        self.x += x
    }
    mutating func moveV(y : Double) {
        self.y += y
    }
}
