//: Playground - noun: a place where people can play

import UIKit

//元组
/*
 元组是Swift中特有的,OC中并没有相关类型
 它是什么呢?
 它是一种数据结构，在数学中应用广泛
 类似于数组或者字典
 可以用于定义一组数据
 组成元组类型的数据可以称为“元素”
 
 */

//定义一组数据 姓名 年龄 身高
//1.使用数组定义一组数据
let array :[Any] = ["lwy",18,1.88]
//1.1> 取数据
let name1 = array[0]
let age1 = array[1]
let height1 = array[2]

//2.使用字典定义数据
let dict :[String : Any] = ["name":"lwy","age":18,"height":1.88]
//2.1> 取名字
dict["name"]
//2.2> 取年龄
dict["age"]
//2.3> 取身高
dict["height"]

//3.使用元组 不同于数组和字典是使用中括号[] 元组是使用() 元组一般是用于方法的返回值
let info = ("lwy", 18,1.88)
//3.1> 取数据 元组可以通过下标来直接取数据 跟数组不同的是数组取下标的是 array[0] 元组的话是 info.0
let myName = info.0
let myAge = info.1
let myHeight = info.2

//3.2> 元组可以给每一个元素起别名
//在上面的例子中 无论是我们在定义数据还是取数据的时候都不知道每个数据的含义 let info = ("lwy", 18,1.88) 我们不知道18是表示什么的数据 info.0取出的数据也不知道代表的是什么 这个时候我们可以给每个元素起一个别名

let userInfo = (userName:"lwy",userAge:18,userHeight:1.88)//跟字典很相似 不过跟字典不同的是字典的话是中括号[],元组的话是小括号(),而且元组的别名不用双引号，直接写字符 字典的话我们一般都是用字符来作为key的 不过在swift中其它数据类型也可以作为key 比如Int

userInfo.userName
userInfo.userAge
userInfo.userHeight
//起了别名之后我们还是可以通过下标来取值
userInfo.2 //取出的数据跟userInfo.userHeight是一样的

//3.3> 元组中每个元素的别名也可以当作元组的名称
let (name2, age2, height2) = ("lwy", 18, 1.88)
//取数据
print(name2)
print(age2)
print(height2)



//可选类型
/*
 注意:
 可选类型时swift中较理解的一个知识点
 暂时先了解,多利用Xcode的提示来使用
 随着学习的深入,慢慢理解其中的原理和好处
 
 概念:
 在OC开发中,如果一个变量暂时不使用,可以赋值为0(基本属性类型)或者赋值为空(对象类型)
 在swift开发中,nil也是一个特殊的类型.因为和真实的类型不匹配是不能赋值的(swift是强类型语言)
 但是开发中赋值nil,在所难免.因此推出了可选类型
 
 可选类型的取值:
 空值
 有值
 */
//let name : String = nil 这样写是错误的 虽然在OC中是正确的 因为nil也是一个特殊类型 并不是字符类型 类型是不一致的 所以不能赋值 因为在swift中不同类型是不能赋值的 （swift是强类型语言）

class Person : NSObject {//定义了一个Person类
//    var name :String 就算不给name赋初始值 也不行 会报错 因为swift有规定： 类中所有的属性在初始化的时候有初始化值
    
}

//1.定义可选类型
//1.1> 常规方法（不常用）
//var name :Optional<String> = nil //可以类比数组的创建
//var names : Array<String> = ["123"] 因为创建的是数组 所以数据类型是Array 数组里面存放的是String类型 所以是Array<String> 同理 可选类型的创建 因为是可选类型 所以是Optional 可选类型存放的是字符串 所以是Optional<String> 我们可以往这个可选类型里面存放字符串 就像能够像数组中存放字符串一样 区别就是数组里面可以存放多个字符串 可选类型只能存放一个字符串 如果再次往可选类型里面存放数据 就会把之前的数据给覆盖掉

//1.2> 第二种定义方法 语法糖
var name : String? = nil
//var name : String? 这样也是可以的 因为可选类型没有明确赋值的话，可选类型的值就是nil

//2.可选类型的使用
//2.1> 给可选类型赋值
//name = 18 这样是错误的 因为我们定义的是只能存放字符串类型的可选类型
name = "lwy"//正确写法

//2.2> 取出可选类型中的值
// 可选类型! :强制解包 需要注意的是在使用强制解包的时候如果可选类型为nil 强制解包系统会崩溃
//print(name!) 
//在强制解包前 先对可选类型进行判断是否为nil
if name != nil {
    print(name!)//每次打印都要解包
    print(name!)
    print(name!)
}

//3.可选绑定
//在取可选类型当中的值的话每次都强制解包的话是比较麻烦的 我们可以这样来使用
//3.1> 写法一 （不常用）
if let tempName = name {
    print(tempName)//这样的话就直接使用tempName 不需要解包
    print(tempName)
    print(tempName)
}
//其实上面的是进行了两步操作 1.先判断name是否有值 如果没有值 则不执行{} 2.如果有值 系统会对可选类型name进行解包 不需要我们自己解包 并把解包后的值赋值给前面的常量
//3.2> 写法二（常用）
if let name = name {//定义的常量名可以和可选类型的名字一样
    print(name)// 这里我们输出的是常量name 而不是可选类型name 因为swift和OC一样 都有一个就近原则
}

//4.可选类型的使用场景
//目的：让代码更加严谨
let str = "123"
let result : Int? = Int(str)


let url :URL? = URL(string:"www.baidu.com")
if let url = url {
    let request = NSURLRequest(url:url as URL)
    
}





		
