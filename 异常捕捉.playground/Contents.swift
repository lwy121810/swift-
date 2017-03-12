//: Playground - noun: a place where people can play

import UIKit

enum MyError : Error {
    case errorOne
    case errorTwo
    case errorThree(String)
    case errorOther(String)
}
func WYlog<T>(_ message : T, line : Int = #line) {
    print("\(message)---\(line)")
}
//定义一个抛出异常的方法 抛出异常需要添加throws关键字 如果方法又返回值需要在 ->前加throws
//在可能抛出异常的方法中。如果有一处抛出异常则这个方法就会停止运行，抛出异常后面的代码将不会执行
func throwsError(num : Int) throws {
    if num == 1 {
        print("----1")
        throw MyError.errorOne// 抛出我们自定义的错误
//        return 这里的代码将不会执行 会报警告
    }
    
    if num == 2 {
        print("----2")
        throw MyError.errorTwo
        
    }
    
    if num == 3 {
        print("----3")
        throw MyError.errorThree("这是第三个异常")
        
    }
    throw MyError.errorOther("其他的异常")
    
}
func throwErrorWithReturn() throws -> String {
    return "这是一个带有返回值的抛出异常的方法"
}


//try throwsError(num: 3)
//let str = try throwErrorWithReturn()
//print(str)

//如果一个方法有可能抛出异常，我们可以在这个方法的后面加上catch关键字来捕获异常
// 比如这个方法会抛出异常 我们可以通过docatch来捕获异常
//在调用的地方，你必须明确的在能抛出错误的方法的前面使用 try ;
do {
    try throwsError(num: 2)
} catch  {//如果有异常抛出就会进入catch
    switch error {
    case MyError.errorOne:
        print(MyError.errorOne)
    default:
        print(MyError.errorOther("其他异常"))
    }
    print(error)//打印信息为 errorTwo
}

//如果确认某段可能抛出异常的代码是不可能抛出异常的 可以使用try!调用
//try throwsError(num: 3)
// do-try-catch错误处理模式
/**
do {
    
    try 语句
    
    　　成功处理语句组
    
} catch 匹配错误 {
    
    错误处理语句组
    
}
 */
//将异常转为可选值 如果一个语句会抛出异常，那么将会返回nil，无论这个语句本来返回什么
let result = try? throwsError(num: 3)
print(result)

