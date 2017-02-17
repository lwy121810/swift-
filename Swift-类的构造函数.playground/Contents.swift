//: Playground - noun: a place where people can play

import UIKit

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
        //name = name 这样写会报错
        self.age = age
    }
    
    //    init(tempName : String,tempAge:Int) {//这种方法不常用
    //        name = tempName;//这样的话就可以直接写成name，不用写成self.name了，
    //        age = tempAge
    //    }
    
    //字典转模型（初始化时传入字典）
    /*
     注意:
     去字典中取出的是NSObject,任意类型.
     可以通过as!转成需要的类型,再赋值(不可以直接赋值)
     */
    // 自定义构造函数,会覆盖init()函数
    init(dict : [String : AnyObject]) {
        let tempName = dict["name"]//可以看到 tempName的类型是AnyObject？ 是一个可选类型，因为我们不确定dict里有没有name这个key 只能知道根据这个键可能取得到值，也可能取不到值，
        //tempName是一个AnyObject？类型 转成String？类型 因为name就是一个String？ 类型
        // as? 最终转成的是一个可选类型 as? String 就是最终转成存储String类型的可选类型
        name = tempName as? String
        
        let tempAge = dict["age"] //tempAge是一个AnyObject？类型
        // as! 最终转成的是一个确定类型
        //        age = tempAge as! Int //这样写的话就相当于强制解包了，强制解包的话需要先判断是否有值
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
    
}
let man = Man(dict:["name":"lwy" as AnyObject])

print(man.age)

//kvc赋值
class Model: NSObject {
    //结构体或者类的类型,必须是可选类型.因为不能保证一定会赋值
    var name : String?
    // 基本数据类型不能是可选类型,否则KVC无法转化
    var age : Int = 0
    // 自定义构造函数,会覆盖init()函数
    init(dic : [String : NSObject]) {
        super.init()//初始化对象
        //不加super.init()这一句，而直接使用下面的方法会报错，因为在调用对象方法的时候必须要保证对象已经创建出来了，所以在调用kvc的时候需要先调用super.init()
        //但是上面已经说过了 在构造函数中,系统会帮助调用super.init(),之所以这里还要调用super.init(),甚至不调用的话会报错,是因为系统帮我们调用的时候是在后面的时候才调用,也就是说系统会在setValuesForKeys方法之后调用Super.init(),这个时候已经晚了
        
        //在当前对象里面调用当前对象的方法可以省略self.
        //        self.setValuesForKeys(dict) self. 可以不用写
        //调用对象的KVC方法字典转模型
        setValuesForKeys(dic)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
// 创建一个Person对象
let dict : [String : AnyObject] = ["name" : "why" as AnyObject, "age" : 18 as AnyObject]
let model = Model(dic:dict as! [String : NSObject])
print(model.age)

