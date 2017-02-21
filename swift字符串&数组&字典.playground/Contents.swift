//: Playground - noun: a place where people can play

import UIKit

/*字符串在任何的开发中使用都是非常频繁的
 OC和Swift中字符串的区别
 在OC中字符串类型时NSString,在Swift中字符串类型是String
 OC中字符串@””,Swift中字符串””
 使用 String 的原因
 String 是一个结构体，性能更高
 NSString 是一个 OC 对象，性能略差
 String 支持直接遍历
 Swift 提供了 String 和 NSString 之间的无缝转换
 */

//定义不可变字符
let str = "hello world"
// 遍历字符串
for c in str.characters {
    print(c)
}

//定义可变字符
var strM = "hello swift"

//获取字符串的长度
// 先获取字符集合 在获取集合的count属性
let count = str.characters.count

//字符串的拼接
let str3 = str + strM

//字符串和其它数据类型的拼接
let name = "lwy"
let age = 18
//OC中是     NSString *info = [NSString stringWithFormat:@"my name is %@, age is %d", name, age];
let info = "my name is \(name),age is \(age)"

//字符串的格式化 比如时间格式 想要把时间格式显示为 xx:xx
let min = 30
let second = 4
// swift中数组可以存储基本数据类型 字典也可以 但是在OC中不可以
// %0ad a是一个数字 表示如果数字位数不足a位的话 数字前面加0 补足a位 如果超过a位 则前面什么都不加 例如 %02d表示的是如果数字不足两位的话前面补0 补足位两位 如果数字超过两位 则什么都不补 ％03d表示不足3位的话 前面补0 补足为3位
let time = String(format:"%03d:%02d", arguments:[min,second])

//字符串的截取
/**
 Swift中提供了特殊的截取方式
 该方式非常麻烦
 Index创建较为麻烦
 简单的方式是将String转成NSString来使用
 在标识符后加:as NSString即可
 */
let urlString = "www.baidu.com"
//把urlString转为NSString再截取字符串 截取之后的字符串是String类型 不是NSString
let header = (urlString as NSString).substring(to: 3)//截取www字符串
let middle = (urlString as NSString).substring(with: NSMakeRange(4, 5))//截取baidu字符串
let footer = (urlString as NSString).substring(from: 10)

//swift截取方式
let headerIndex = urlString.index(urlString.startIndex, offsetBy: 3)
let header2 = urlString.substring(to: headerIndex)
let footerIndex = urlString.index(urlString.endIndex, offsetBy: -3)
let footer2 = urlString.substring(from: footerIndex)
let startIndex = urlString.index(urlString.startIndex, offsetBy: 4)
let endIndex = urlString.index(urlString.startIndex, offsetBy: 9)
let range2 = Range(startIndex..<endIndex)
let middle2 = urlString.substring(with: range2)



//数组
/*
 数组（Array）是一串有序的由相同类型元素构成的集合
 数组中的集合元素是有序的，可以重复出现
 Swift中的数组
 swift数组类型是Array，是一个泛型集合 必须告诉数组存放的是什么类型
 
 */

//数组的定义
//定义不可变数组 let修饰的数组就是不可变数组
let array = ["lwy","zym","rx"]// 点击alt键可以看到他的类型是 array:[String]类型 所以也可以写成这样
let arr :[String] = ["132"]
//定义存放any类型的不可变数组
let arrayAny :[Any] = ["123","456",18,20]
//或者
let arrAny = ["132","123",30] as [Any]



//定义不可变数组 OC中是[NSMutableArray array];方式创建的 在swift中创建对象的方式是 类型()的形式创建 比如UIView()创建一个view,可以得出数组的话应该是 var arrM = Array()创建 但是会发现这样写的话是会报错的 因为数组是一个泛型集合 必须告诉数组应该存放什么样的类型
//var arrM = Array() 错误的写法
var arrayM = Array<String>()// 正确的写法 定义一个存放字符类型的可变数组 不过很少用到
var arrM = [String]()// 这种写法比较多一些
// 定义存放any类型的可变数组
var arrayMAny = [Any]()


//数组的操作
//增加元素
arrayM.append("lwy")
arrayM.append("zhangsan")
arrayM.append("lisi")
arrayM.append("wangwu")
arrayM.append("zhouliu")
arrayM.append("shengqi")

//修改元素 直接赋值给相应的下标
arrayM[0] = "wangwu"
arrayM

//删除元素 会返回删除的数据
let one = arrayM.remove(at: 1)
arrayM

let last = arrayM.removeLast()

//获取某个下标的元素
arrayM[0]
array[0]
//遍历数组
//1.需要用到下标
for i in 0..<arrayM.count {
    print(arrayM[i])
}
//2.不需要用到下标
for name in arrayM {
    print(name)
}

//不常见的 比如 只是想遍历数组中的前两个元素
for i in 0..<2 {
    print(arrayM[i])
}

for name in arrayM[0..<2] {
    print(name)
}
//遍历数组的同时获取下标值
let names = ["why", "yz", "lnj", "lmj"]
for (index, name) in names.enumerated() {
    print(index)
    print(name)
}


//数组的合并 
// 比如想把array不可变数组和arrayM数组合并在一块 如果用OC的方法的话应该是这样的
for name in array {
    arrayM.append(name)
}
//swift的话可以直接相加
let result = arrayM + array
//不过需要注意的是只有两个数组的类型是完全一样的时候才可以相加合并 不同类型的话是不能相加合并的 比如一个数组中存放的是数字 另一个数组存放的是字符 这时候这两个数组是不能相加的


// 不建议一个数组中存放多种类型的数据
var array3 :[Any] = [2, 3, "why"]
var array4 :[Any] = ["yz", 23]
array3 + array4

// 字典 跟OC中一样 都是无序的
/*
 字典允许按照某个键来访问元素
 字典是由两部分集合构成的，一个是键（key）集合，一个是值（value）集合
 键集合是不能有重复元素的，而值集合是可以重复的，键和值是成对出现的
 
 Swift中的字典
 Swift字典类型是Dictionary，也是一个泛型集合
 */

//定义一个不可变字典
let dict1 : [String : Any] = ["name" : "why", "age" : 18]
//可以理解为转换为String:Any类型的字典
let dict2 = ["name":"lwy","age":18] as [String : Any]

//定义可变字典
var dictM = [String : Any]()
//可变字典的操作
//增加元素
dictM["name"] = "lwy"
dictM["age"] = 18
dictM["height"] = 170.0
dictM

//删除数据 会返回删除的value
let nameValue = dictM.removeValue(forKey: "height")
dictM
//修改数据
dictM["name"] = "yw" // 可以看到修改数据和增加数据的方法是一样的 也就是当我们修改一个不存在的key的数据时 就会增加一个相应key的数据
dictM
dictM.updateValue("yu", forKey: "name")
dictM

//查询字典
dictM["name"]

//字典的遍历
//1.遍历所有的值
for value in dict1.values {
    print(value)
}
//2.遍历所有的key
for key in dict1.keys {
    print(key)
}
//3.遍历所有的键值对
for (key, value) in dict1 {
    print(key)
    print(value)
}

//字典的合并
var dictM1 = ["name":"lwy","age":20] as [String : Any]
var dictM2 : [String : Any] = ["height":18 ,"phoneNum":"10086"]
//字典的合并不能像数组那样直接相加合并 即使字典的类型完全一致也不可以相加
//dictM1 + dictM2 dictM1和dictM2是完全一样的类型 但是也不能相加 这样是错误的
for (key, value) in dictM1 {
    dictM2[key] = value
}
dictM2











