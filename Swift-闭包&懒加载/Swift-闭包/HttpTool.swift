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
        self.callBack = callBack// 这里就造成了循环引用
        
        DispatchQueue.global().async {// 异步请求 不会造成线程阻塞
            print("发送网络请求\(Thread.current)")
            
            DispatchQueue.main.async {
                print("回到主线程\(Thread.current)")
                callBack("jsonData")
            }
        }
        
    }
    
}
