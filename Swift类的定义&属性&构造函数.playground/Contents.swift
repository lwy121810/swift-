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
    var average : Double {//因为average 提供了setter 和 getter 所以average是读写类型
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
stu1.average = 60.0

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


//类的构造函数
/*介绍
 构造函数类似于OC中的初始化方法:init方法
 默认情况下载创建一个类时,必然会调用一个构造函数
 即便是没有编写任何构造函数，编译器也会提供一个默认的构造函数。
 如果是继承自NSObject,可以对父类的构造函数进行重写
 类中所有的属性在初始化的时候有初始化值
 */
//构造函数的基本使用
//类的属性必须有值
//如果不是在定义时初始化值,可以在构造函数中赋值
class Woman : NSObject {
    var name : String
    var age : Int
    
    // 重写了NSObject(父类)的构造方法
    // 在构造函数中（只有在构造函数里面）,如果没有明确super.init(),那么系统会帮助调用super.init()
    //父类的init方法，子类再来重写的时候，叫做方法的重写，方法的重写，需要在方法前加 override
    override init() {
        name = ""
        age = 0
    }
}

let wo = Woman()

//自定义构造函数 初始化时给属性赋值
class Man : NSObject {
    var name : String?
    var age : Int = 0
    
    /*
     很多时候,我们在创建一个对象时就会给属性赋值
     可以自定义构造函数
     注意:如果自定义了构造函数,会覆盖init()方法.即不在有默认的构造函数
     */
    init(name:String, age:Int) {
        self.name = name //这里之所以写成self.name是因为直接写成name的话会产生歧义，会分不清属性name和参数name
        //        name = name 这样写会报错
        self.age = age
    }
    
    //    init(tempName : String,tempAge:Int) {//这种方法不常用
    //        name = tempName;//这样的话就可以直接写成name，不用写成self.name了，
    //        age = tempAge
    //    }
    
    init(dict : [String : AnyObject]) {
        let tempName = dict["name"]//可以看到 tempName的类型是AnyObject？ 是一个可选类型，因为我们不确定dict里有没有name这个key 只能知道根据这个键可能取得到值，也可能取不到值，
        //tempName是一个AnyObject？类型 转成String？类型 因为name就是一个String？ 类型
        // as? 最终转成的是一个可选类型 as? String 就是最终转成存储String类型的可选类型
        name = tempName as? String
        
        let tempAge = dict["age"] //tempAge是一个AnyObject？类型
        // as! 最终转成的是一个确定类型
        age = tempAge as! Int //这样写的话就相当于强制解包了，强制解包的话需要先判断是否有值
        //1.先从AnyObject? 转成Int？类型
        let tempAge1 = tempAge as? Int
        if tempAge1 != nil {
            age = tempAge1!//从Int？类型解包 然后赋值给age
        }
        //上面的几句也可以写成一句话 常见写法
        if let tempAge = dict["age"] as? Int {
            age = tempAge
        }
        
        print(age)
    }
    
    init(dic : [String : AnyObject]) {
        super.init()
        //不加super.init()这一句，而直接使用下面的方法会报错，因为在调用对象方法的时候必须要保证对象已经创建出来了，所以在调用kvc的时候需要先调用super.init()
        //但是上面已经说过了 在构造函数中,系统会帮助调用super.init(),之所以这里还要调用super.init(),甚至不调用的话会报错,是因为系统帮我们调用的时候是在后面的时候才调用,也就是说系统会在setValuesForKeys方法之后调用Super.init(),这个时候已经晚了
        
        //在当前对象里面调用当前对象的方法可以省略self.
        //        self.setValuesForKeys(dict) self. 可以不用写
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
let man = Man(dict:["name":"lwy" as AnyObject])

print(man.age)


