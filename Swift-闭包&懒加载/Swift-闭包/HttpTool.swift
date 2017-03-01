//
//  HttpTool.swift
//  Swift-闭包
//
//  Created by yons on 17/2/21.
//  Copyright © 2017年 yons. All rights reserved.
//

import UIKit

class HttpTool: NSObject {
    
    var callBack : ((_ jsonData : String) -> ())?
    
    
    //闭包类型： (参数列表) -> (返回值类型)
    func loadData(callBack : @escaping (_ jsonData : String) -> ()){
        self.callBack = callBack// 这里就造成了循环引用 _ jsonData的_ 不想要外部参数的时候可以加_
        /**
         @escaping 逃逸闭包
         逃逸的闭包常用于异步的操作，这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。例如这个闭包是异步处理一个网络请求，只有当请求结束后，闭包的生命周期才结束。当闭包作为函数的参数传入时，很有可能这个闭包在函数返回之后才会被执行。
         */
        DispatchQueue.global().async {// 异步请求 不会造成线程阻塞
            print("发送网络请求\(Thread.current)")
            
            DispatchQueue.main.async {
                print("回到主线程\(Thread.current)")
                callBack("jsonData")
            }
        }
        
    }
    
    func requestData(callBack : (_ json : String) -> ()) {
        
        callBack("12")
    }
    
}
