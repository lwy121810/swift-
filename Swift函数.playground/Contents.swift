//: Playground - noun: a place where people can play

import UIKit

//函数的介绍
/*
 函数相当于OC中的方法
 函数的格式如下
 func 函数名(参数列表) -> 返回值类型 {
 代码块
 return 返回值
 }
 
 func 函数名(参数名：参数类型) -> 返回值类型 {
 
 return 返回值
 }
 func是关键字,多个参数列表之间可以用逗号（,）分隔，也可以没有参数
 使用箭头“->”指向返回值类型
 如果函数没有返回值，返回值为Void.并且“-> 返回值类型”部分可以省略
 
 */
// 无参无返回值
func about() -> Void {
    print("iPhone 7")
}
//调用函数
about()
//无返回值的话-> Void常常省略
func about1() {
    print("iphone 7")
}
about1()

//无参数有返回值
func callPhone() -> String {
    
    return "callPhone"
}
callPhone()

//有参数无返回值
func readMessage(message:String) {
    print(message)
}

//有参数有返回值
func sumTwoNum(num1 : Int, num2 : Int) -> Int {
    
    return num1 + num2;
}

sumTwoNum(num1: 5, num2: 8)

//函数的使用注意
/*
 1: 外部参数和内部参数
 在函数内部可以看到的参数,就是内部参数
 在函数外面可以看到的参数,就是外部参数
 
 内部参数:在函数内部可以看到的参数名称,称之为内部参数
 外部参数:在函数调用时,可以看到的参数,成之为外部参数
 
 默认所有的参数都是外部参数和内部参数
 如果不想要外部参数,可以在参数名称前加_
 
 */

func sum(num1 : Int , num2 : Int) -> Int {
    return num1 + num2;//在函数内部可以看到num1 num2参数 所以他们是哪部参数
}
sum(num1: 5, num2: 20)//在函数外面 我们也可以看到num1 num2参数 所以他们也是外部参数
//加入我们不想要外部参数 上面的也可以写成这样
func sum1(_ num1 : Int , num2 : Int) -> Int {
    return num1 + num2;
}
sum1(5, num2: 25)//现在num1只是内部参数 不是外部参数 num2既是内部参数 也是外部参数

//2.函数的重载 函数名相同 参数不同（1.参数个数不同 2.参数类型不同）
func sum(num1 : Int, num2 : Int, num3 : Int) -> Int {
    return num1 + num2 + num3;
}
sum(num1: 1, num2: 2, num3: 3)


//3.默认参数
// 某些情况,如果没有传入具体的参数,可以使用默认参数

func makeCoffee(coffeeName:String = "雀巢") {
    print("制作了一杯\(coffeeName)咖啡")
}
makeCoffee(coffeeName: "卡布奇诺")
makeCoffee(coffeeName: "拿铁")
makeCoffee()

//4.可变参数
/**
 swift中函数的参数个数可以变化，它可以接受不确定数量的输入类型参数
 它们必须具有相同的类型
 我们可以通过在参数类型后面加入 ... 的方式来指示这是可变参数
 */
func sumSomeNums(nums:Int...) -> Int {
    var result = 0
    for num in nums {
        result += num
    }
    return result
}
sumSomeNums(nums: 5,6,10,56)

//5.引用参数
/**
 默认情况下,函数的参数是值传递.如果想改变外面的变量,则需要传递变量的地址
 必须是变量,因为需要在内部改变其值
 Swift提供的inout关键字就可以实现
 对比下列两个函数
 
 学习swift中字符串、数组、字典、元组和可选类型的定义方法和基本操作（字符、数组、字典的增删改查、遍历合并等）
 */
//比如我们想通过一个函数来交换两个变量的值
var m = 60
var n = 70
func swapNum( num1 : inout Int, num2 : inout Int) {
    let temp = num1
    num1 = num2
    num2 = temp
}
swapNum(num1: &m, num2: &n)
print("m:\(m), n:\(n)")

//6.函数的嵌套使用（不常用）
func test() {
    
    func demo() {
        print("demo")
    }
    demo()
    print("test")
}
test()



