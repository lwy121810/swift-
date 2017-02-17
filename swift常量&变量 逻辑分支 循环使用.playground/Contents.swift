//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//swift中的常量与变量

//常量的本质是他保存的内存地址不可以更改 但是可以通过内存地址拿到对象内部的属性 修改对象的属性
/**
 常量的使用
 1.优先使用常量（let）防止不小心被修改
 2.常量的本质：是其指向的内存地址不可以修改（比如其指向的内存地址为0x100，在后续是不能修改的，智能是0x100，不能修改为0x200） 但是我们可以通过内存地址找到对应的对象，之后修改对象内部的属性
 
 */

//let/var 标识符 : 标识符类型 = 值


let a : Int = 10
//创建常量view
//UIView()相当于OC中的[[UIView alloc] init];
let view : UIView = UIView()
//view = UIView() 错误写法 view的本质是一个指向某个内存的指针，声明为常量（let）类型 则其内存地址不能修改 所以这样写的话是错误的
view.alpha = 0.5 //这里是通过内存地址找到对应的对象 修改了对象的alpha属性 所以这样式可以的 我们操作的是地址指向的对象 不是地址

view.frame = CGRect(x:0,y:0,width:100,height:100)
view.backgroundColor = UIColor.red

let btn = UIButton(type:.custom)
btn .setTitle("btn", for: UIControlState.normal)
view .addSubview(btn);

//swift中的数据类型
/**
 ## Swift类型的介绍
 
 Swift中的数据类型也有:整型/浮点型/对象类型/结构体类型等等
 先了解整型和浮点型
 整型
 有符号
 Int8 : 有符号8位整型
 Int16 : 有符号16位整型
 Int32 : 有符号32位整型
 Int64 : 有符号64位整型
 Int : 和平台相关(默认,相当于OC的NSInteger)
 无符号
 UInt8 : 无符号8位整型
 UInt16 : 无符号16位整型
 UInt32 : 无符号32位整型
 UInt64 : 无符号64位整型
 UInt : 和平台相关(常用,相当于OC的NSUInteger)(默认)
 浮点型
 Float : 32位浮点型
 Double : 64浮点型(默认)
 
 
 ## Swift中的类型推导
 1.Swift是强类型语言
 2.Swift中任何一个标识符都有明确的类型
 注意：如果定义一个标识符时有直接赋值，那么标识符后面的类型可以省略，因为swift有类型推导，会根据后面的数据复制来决定前面的数据类型 可以通过option+鼠标左键来查看变量的数据类型
 
 */

// let m : Int = 10可以省略写成下面这样
let m = 10
// n是Double类型
let n = 10.00


var view1 = UIView()

//Swift中的基本运算
/*
 ## swift在进行基本运算的时候必须保持数据类型一致 否则会报错
 1.swift只有相同类型才能运算
 2.swift没有隐式转换
 */
//let result = m + n 这样式错误的 因为m是Int类型 n是Double类型 不能进行计算
//1.可以把m转换成Double类型进行转换 得到的result1也是Double类型
let result1 = Double(m) + n //转换的话是类型（标识符）跟OC不一样 OC的话是（类型）标识符
//2.也可以把n转换成Int类型 相应的result2也是Int类型
let result2 = m + Int(n)

//逻辑分支
/**
 分支即if/switch/三目运算符等判断语句
 通过分支语句可以控制程序的执行流程
 */

//if语法
/*
 跟OC有点区别
 1.判断句可以不加()
 2.判断句中必须有明确的真假
   不再有非0／nil 即真
   必须有明确的Bool值 Bool值有两个值 true／false
 */

let p = 10
/* 错误写法
if p {
    print(p)
}
 这种写法在OC中是可以的 因为OC中有个非0即真 但在swift中是错误的
*/
//正确写法
if p > 0 {//可以不写()
    print(p)
}

//if － else if

let score = 80

if score < 0 || score > 100 {
    print("不正常的分数")
} else if score < 60 {
    print("不及格")
} else if score <= 80 {
    print("良好")
} else if score <= 90 {
    print("优秀")
} else {
    print("完美")
}

// 三目运算 跟OC中一样
let x = 8
let y = 10

let max = x > y ? x : y
print(max)

//guard的使用
/*
 guard是swift2.0增加的语法
 它与if语句非常相似 目的是为了增强程序的可读性
 
 注意
 guard必须在函数中调用
 guard语句必须带有else语句
 当条件表达式为ture的时候 跳过else语句中的内容 执行语句组内容
 当条件表达式为false的时候 执行else语句中的内容 else语句中必须有跳转语句 跳转语句一般是return break continue和throw
 */
//guard y > 0 else {
//    
//    return
//}

//比如一个去网吧上网的场景 必须年满18岁才能上网
let age = 20
//声明函数
func online(age : Int) {
    // 用if－else语句
    if age < 18 {
        print("不可以上网")
    } else {
        print("可以上网")
    }
    //用guard语句表示
    guard age >= 18 else {//else里面是未满18的
        print("未满18岁 不能上网")
        return
    }
    print("可以上网")
    
    //从上面的例子很难看出guard的可读性的优势 但是换一个场景 想要上网的话需要满足18岁 必须有身份证 必须有钱才能够上网
    // 用if－else语句的话
    /*
    if age >= 18 {
        //
        if 带了身份证 {
            if 拿了钱 {
                print("开始开机上网")
            } else {//没有拿钱
                print("没有拿钱");
            }
        } else {//没有身份证
            print("没拿身份证")
        }
        
    } else {
        print("未满18 不能上网")
    }
    */
    
    //使用guard语句的话
    /*
    guard age >= 18 else {
        print("未满18 不能上网")
        return
    }
    
    guard 带了身份证 else {
        print("没拿身份证")
        return
    }
    
    guard 拿了钱 else {
        print("没有拿钱");
        return
    }
    print("开始开机上网")
    */
    
    //从上面的例子中可以看出 guard的语句更具有可读性
}

//调用函数
online(age: age)


//Switch语法
/*
 swift对Switch进行了大大的增强，使其拥有其他语言中没有的特性
 */
//switch的简单使用
//基本用法跟OC一致 不同之处就是swift的switch后可以不跟() case后可以不写break（默认会有break）
//0: 男 1:女 其它：其它
let sex = 0
switch sex {
case 0:
    print("男")
case 1 :
    print("女")
default:
    print("其它")
}
//2.基本用法补充
//1.一个case判断中可以判断多个值 多个值以 , 分开
switch sex {
case 0 , 1:
    print("正常人")
default:
    print("其它")
}

// 1.如果希望一个case出现case穿透 可以使用fallthrouch 不过很少使用
switch sex {
case 0:
    print("男")
    fallthrough
case 1:
    print("正常人")
default:
    print("其它")
}
//switch可以判断浮点型 OC中是不可以的
let pai = 3.14
switch pai {
case 3.14:
    print("π")
default:
    print("非π")
}
// switch可以判断字符串
let operation = "+"
let e = 10, f = 20

var result = 0

switch operation {
case "+" :
    result = e + f
case "-" :
    result = e - f
case "*" :
    result = e * f
case "/" :
    result = e / f
default:
    print("非法的操作")
}
print(result)

//switch可以判断区间
/**
 什么是区间？
 通常我们是指的数字区间： 0~100, 100~200
 
 swift常见的有两种区间
 1.半开半闭区间： 0..< 10 表示的是0～9 不包括 10
 2.闭区间： 0...10 表示的是0～10 包括10
 */

//还是以考试分数为例
switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("良好")
case 80..<90:
    print("优秀")
case 90...100:
    print("完美")
default:
    print("不正常的分数")
}


//循环语句
//for 循环
/* OC中的写法
 for (int a = 0; i < 10; i++) {
    NSLog(@"%d", i);
 }
 */
//
for i in 0..<10 {
    print(i)
}

//当我们在循环语句中不用下标值的时候 可以使用_代替
for _ in 0...9 {
    print("hello world")
}

//while 循环
//while和if一样 必须有明确的真假 没有非0即真 ()可以省略
var q = 0
while q < 10 {
    q += 1// ++ -- 操作在3.0之后被废弃了
}

// do while 在swift中 使用repeat关键字 代替do－while中do关键字
var g = 10
repeat {
    print(g)
    g += 1
} while g < 20

