//: Playground - noun: a place where people can play

import UIKit
/*
 Swift也是一门面向对象开发的语言
 面向对象的基础是类,类产生了对象
 在Swift中如何定义类呢?
 class是Swift中的关键字,用于定义类
 
 注意:
 定义的类,可以没有父类.那么该类是rootClass
 通常情况下,定义类时.继承自NSObject(非OC的NSObject)
 
 class 类名 : SuperClass { 有父类
 //定义属性和方法
 }
 
 class 类名 { 没有父类
 //定义属性和方法
 }
 
 */

//定义一个Person类
class Person : NSObject {
    var age = 0
//    var height : Int 这样是错误的，在swift中，任何一个类在创建对象的时候，需要保证对象的每个属性都有一个初始化值
    
    //定义一个字符串类型的属性
//    var name : String = "" 这样也是可以的 但是我们一般在给字符串类型赋初始值的时候都是赋值为nil，但是nil不是String类型，不能直接赋值给属性，这就需要用到前面学习的可选类型
//    var name : String? = nil
    var name : String? //上面的也可以写成这样，可选类型在没有明确赋值的时候，值就是nil
    
    
    //覆盖父类的方法 需要用override关键字 跟OC中一样 防止被赋值一个没有的属性
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

let p = Person()
//赋值
p.age = 20

p.setValuesForKeys(["age":18,"name":"lwy"])


//类的属性
/*
 Swift中的属性有多种
 1.存储属性：存储实例的变量和常量 跟OC中的属性一样
 2.计算属性：通过某种方式计算出来的属性
 3.类属性：跟整个类自身相关的属性
 */

//1.存储属性
/*
 存储属性是最简单的属性，它作为类实例的一部分，用于存储常量和变量
 可以给存储属性提供一个默认值，也可以在初始化方法中对其进行初始化
 
 下面是存储属性的写法
 age和name都是存储属性,用来记录该学生的年龄和姓名
 chineseScore和mathScore也是存储属性,用来记录该学生的语文分数和数学分数
 */
class Student : NSObject {
    //定义存储属性
    var age : Int = 0
    var name : String?
    
    var chineseScore : Double = 0.0
    var mathScore = 0.0
}

let stu = Student()
//给存储属性赋值
stu.age = 18
stu.name = "lwy"
stu.chineseScore = 85.0
stu.mathScore = 60.0

//2.计算属性
/*
 计算属性并不存储实际的值，而是提供一个getter和一个可选的setter来间接获取和设置其它属性
 计算属性一般只提供getter方法
 如果只提供getter，而不提供setter，则该计算属性为只读属性,并且可以省略get{}
 下面是计算属性的写法
 averageScore是计算属性,通过chineseScore和mathScore计算而来的属性
 在setter方法中有一个newValue变量,是系统指定分配的
 */
class STUDENT : NSObject {
    //定义存储属性
    // 注意一:在开发中,如果是对象或者结构体,在没有赋值的情况下通常定义为可选类型
    var name : String?
    // 注意二:在开发中,如果是基本属性类型,比如int类型,在没有赋值的情况下,通常直接给一个默认的值0
    var age : Int = 0
    
    var chineseScore : Double = 0.0
    var mathScore = 0.0
    
    //通过一个函数来计算平均分 不常用
//    func average() -> Double {
//        return (chineseScore + self.mathScore) * 0.5
//    }
    //定义计算属性
    var average : Double {
        get {
            return (chineseScore + self.mathScore) * 0.5//我们可以不用self.chineseScore,而是直接使用chineseScore
        }
        // newValue是系统分配的变量名,内部存储着新值
        set {
            self.average = newValue
        }
    }
    //如果只提供getter，而不提供setter，则该计算属性为只读属性,并且可以省略get{}
    //因为平均分的话只需要设置为只读属性就行了 所以可以写成这样
//    var averageScore : Double {
//        get {
//            return (chineseScore + mathScore) * 0.5
//        }
//    }
    //或者直接写成这样 省略 get {}
    var averageScore : Double {//averageScore为只读属性
        return (chineseScore + mathScore) * 0.5
    }
    
}
let stu1 = STUDENT()
//赋值
stu1.chineseScore = 85.0
stu1.mathScore = 60.0

//通过函数计算平均分
//let average = stu1.average()
//average

//因为average属性是读写类型的， 可以直接赋值


//通过计算属性直接拿到平均分 averageScore是只读的
let average = stu1.averageScore
average

//3.类属性
/*
 1.类属性是与类相关联的，而不是与类的实例相关联
 2.所有的类核实例共有一份类属性，因此在某一处修改之后，该类属性就会被修改
 3.类属性的设置和修改，需要通过类来完成
 4.类属性用static来修饰
 */
class ChineseStudent : NSObject {
    //定义了一个记录学生有多少门课程的类属性
    static var corseCount : Int = 0
}
//设置类属性的值
ChineseStudent.corseCount = 3
//取出类属性的值
print(ChineseStudent.corseCount)


//监听属性的改变
/*
 在OC中我们可以重写set方法来监听属性的改变
 Swift中可以通过属性观察者来监听和响应属性值的变化
 通常是监听存储属性和类属性的改变.(对于计算属性，我们不需要定义属性观察者，因为我们可以在计算属性的setter中直接观察并响应这种值的变化)
 
 我们通过设置以下观察方法来定义观察者
 willSet：在属性值被存储之前设置。此时新属性值作为一个常量参数被传入。该参数名默认为newValue，我们可以自己定义该参数名
 didSet：在新属性值被存储后立即调用。与willSet相同，此时传入的是属性的旧值，默认参数名为oldValue
 willSet与didSet只有在属性第一次被设置时才会调用，在初始化时，不会去调用这些监听方法
 监听的方式如下:
 监听age和name的变化
 */
class Model :NSObject {
    var name : String? {
//        willSet {
//            print(name ?? "lwy")
//            print(newValue ?? "lwy")
//        }
//        
//        didSet {
//            print(oldValue ?? "lwy")
//        }
        
        // 可以给newValue自定义名称
        willSet (new){ // 属性即将改变,还未改变时会调用的方法
            // 在该方法中有一个默认的系统属性newValue,用于存储新值
            print(name ?? "name")
            print(new ?? "new")
        }
        // 可以给oldValue自定义名称
        didSet (old) { // 属性值已经改变了,会调用的方法
            // 在该方法中有一个默认的系统属性oldValue,用于存储旧值
            print(name ?? "name")
            print(old ?? "old")
        }
 
    }
}
let model = Model()
model.name = "why"


